FROM hugomods/hugo:exts-latest AS builder
WORKDIR /src
COPY . .
RUN hugo --minify -e production --baseURL "https://willem.vooijs.eu/"

FROM nginx:stable-alpine
COPY --from=builder /src/public /usr/share/nginx/html
