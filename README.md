# Personal website

https://vooijs.eu

## Stack

- **[Hugo](https://gohugo.io/)** static site generator
- **[hugo-blog-awesome](https://github.com/hugo-sid/hugo-blog-awesome)** theme (Go module)
- **[GitHub Pages](https://pages.github.com/)** hosts the built site

## Deployment

Pushing to `main` triggers the `.github/workflows/deploy.yml` GitHub Actions workflow, which builds the Hugo site and deploys it to GitHub Pages. No manual steps required.

The canonical custom domain (`vooijs.eu`) is configured in the repository's Pages settings and pinned via `static/CNAME`. GitHub Pages automatically serves `www.vooijs.eu` and 301-redirects it to the apex.

## Local development

```bash
hugo server -D
```
