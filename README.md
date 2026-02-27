# Personal website

https://willem.vooijs.eu

## Stack

- **[Hugo](https://gohugo.io/)** static site generator
- **[hugo-blog-awesome](https://github.com/hugo-sid/hugo-blog-awesome)** theme (Go module)
- **nginx** serves the built site with Cache-Control headers

## Deployment

Pushing to `main` triggers a GitHub Actions workflow that builds a Docker image (Hugo + nginx) and pushes it to the GitHub Container Registry (`ghcr.io/wildekek/personal-website:latest`).

Deploying to the server is a manual step:

```bash
docker compose pull personal-website && docker compose up -d personal-website
```

On startup, the container automatically purges the Cloudflare cache. This requires `CF_ZONE_ID` and `CF_API_TOKEN` environment variables to be set on the server (Cache Purge permission only).

## Local development

```bash
hugo server -D
```
