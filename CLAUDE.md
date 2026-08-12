# CLAUDE.md

Hugo site, deployed to GitHub Pages by `.github/workflows/deploy.yml` on push to
`main`. See README.md for the stack.

## At the start of every session: check for updates

Willem wants to run on latest. **Frequent small bumps beat infrequent large
ones** — a version behind is cheap to move, five versions behind is an
afternoon. So at the start of a session, before other work, check all four
moving parts and offer to bump whatever is behind. Do the bump when he says so;
don't silently skip the check because the session is about something else.

```bash
# Hugo — pinned in .github/workflows/deploy.yml
curl -s https://api.github.com/repos/gohugoio/hugo/releases/latest | grep -m1 tag_name
hugo version                     # local Homebrew build, keep it on the same version

# Theme — pinned in go.mod
curl -s "https://api.github.com/repos/hugo-sid/hugo-blog-awesome/tags?per_page=5" | grep '"name"'

# GitHub Actions — pinned in .github/workflows/deploy.yml
for r in actions/checkout actions/configure-pages actions/upload-pages-artifact \
         actions/deploy-pages peaceiris/actions-hugo; do
  printf "%-34s " "$r"
  curl -s "https://api.github.com/repos/$r/releases/latest" | grep -m1 tag_name
done
```

Three traps, each of which has already bitten once:

- **Check GitHub tags for the theme, not the Go proxy.** A major version needs a
  `/vN` suffix in the module path; without it `go list -m -versions` and
  `hugo mod get -u` both report the old line as newest and hide the new one
  entirely.
- **Re-diff every override after a theme bump** (see below). This is the step
  that actually matters and the easiest to skip.
- **Keep local Hugo and the CI pin on the same version**, or local verification
  is not evidence about CI.

Bump one thing per commit so a bad one is easy to isolate and revert.

Action bumps are safe to verify in production — a failed Pages workflow leaves
the previous deployment serving, so the live site cannot break. Hugo and theme
bumps are not: they change the built output, so verify those locally first.

## Theme overrides

The theme is a **Go module**, not files in this repo:
`github.com/hugo-sid/hugo-blog-awesome/v2` (pinned in `go.mod`). Its source lives
in Hugo's module cache:

```
~/Library/Caches/hugo_cache/modules/filecache/modules/pkg/mod/github.com/hugo-sid/hugo-blog-awesome/v2@<version>/
```

Read theme source from there. A `themes/hugo-blog-awesome/` directory used to sit
in the repo; it was a stale copy Hugo never read, and it was deleted in 483d66a.

Everything in `layouts/` overrides a module partial. Each file names its upstream
counterpart and its deviations in a comment at the top. **On every theme bump,
re-diff each override against its upstream file and re-apply only the deviation** —
otherwise the override silently freezes old behaviour and shadows upstream fixes.
Note v2 moved `layouts/partials/` to `layouts/_partials/`; our overrides still sit
at the old paths and resolve via Hugo's backward compatibility.

CI has no PR check — it only builds on push to `main`, so a template error
deploys straight to the live site. Verify locally before pushing:

```bash
hugo --minify -e production --baseURL "https://vooijs.eu/" -d /tmp/out
```

Build once with overrides moved aside and once with them in place, then
`diff -rq` the two output trees to prove only the intended output changed.

## Pending: upstream fixes to contribute

Two bugs found in hugo-blog-awesome v2.1.0 while upgrading from v1.21.0
(2026-08-11). Both affect multilingual sites. Not yet reported — file as separate
issues, or send PRs.

### 1. Post dates are no longer localised (regression from v1.21.0)

**Why we care:** this is the only reason `layouts/partials/postCard.html` exists.
Delete that override once upstream lands a fix.

`layouts/_partials/postCard.html:14` switched from Hugo's `time.Format` to Go's
method of the same name:

```go-html-template
{{/* v1.21.0 */}}  {{ time.Format $configDateFormat .Date }}   ← locale-aware
{{/* v2.1.0  */}}  {{ .Date.Format $configDateFormat }}        ← always English
```

Hugo's `time.Format` localises month names via the language's `locale`.
`.Date.Format` is Go's `time.Time.Format` and has no locale awareness. v1.21.0
even carried a comment marking the method call as `OLD FORMAT`; v2 reverted to it.

Repro: two languages configured (`nl` with `locale: nl`), `params.dateFormat:
January 2, 2006`. Dutch list pages render `June 26, 2026` where v1 rendered
`juni 26, 2026`. Hugo v0.164.0+extended, theme v2.1.0.

Fix: restore `{{ time.Format $configDateFormat .Date }}`.

**The strongest evidence, measured here:** `.Date.Format` does not merely lose
localisation, it makes the correct fix impossible. Hugo's locale-aware `:date_*`
tokens are a `time.Format` feature; passing one to Go's method renders it as a
literal string. With `params.dateFormat: ":date_long"` and the stock theme, both
languages print:

```
:date_long
```

That is why the theme's default had to become the hardcoded `"2 Jan 2006"`.

Two things to raise alongside it:

- `layouts/single.html:11` uses the same non-localised `{{ .Format
  $configDateFormat }}`, so stock installs are likely affected on single pages
  too. We never saw it because `layouts/_default/single.html` overrides it here.
  Unconfirmed against a stock install — check before asserting.
- v2 changed the `$configDateFormat` default from `":date_medium"` to
  `"2 Jan 2006"`, which looks like a workaround for the bug rather than a
  choice. Once `time.Format` is restored, a `:date_*` default is more robust for
  sites that never set `params.dateFormat`.

Note for this site: fixing the theme partial was necessary but not sufficient.
`params.dateFormat` also had to move from `"January 2, 2006"` to `":date_long"`,
because a Go reference layout hardcodes English month-first ordering — Dutch
rendered "juni 26, 2026" instead of "26 juni 2026" even with `time.Format` in
place. Localised names and localised *order* are two separate problems.

### 2. Language switcher emits a stray `ZgotmplZ` attribute

Cosmetic — the switcher works and the right option is selected. But the junk
attribute is in the page source and validators flag it as not allowed on
`option`. We chose not to override the whole 60-line header partial for it.

`layouts/_partials/header.html:45`:

```go-html-template
<option id="{{ .Language }}" value="{{ .Permalink }}" {{ cond (eq $pageLang .Lang) "selected" "" }}>
```

`cond` returns a plain string into **attribute-name position**. On the false
branch it yields `""`, and `html/template` substitutes its `ZgotmplZ` sentinel —
the marker for a value it could not prove safe — rather than emitting nothing.
Output on every non-current language option:

```html
<option id="nl" value="https://vooijs.eu/nl/" ZgotmplZ>
```

Fix: use a conditional block so the false branch emits nothing.

```go-html-template
<option id="{{ .Language }}" value="{{ .Permalink }}" {{ if eq $pageLang .Lang }}selected{{ end }}>
```

Close to what v1.21.0 did, and it keeps a dynamic string out of attribute-name
position.
