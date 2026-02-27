FROM hugomods/hugo:latest AS builder
WORKDIR /src
COPY . .
RUN hugo --minify -e production --baseURL "https://willem.vooijs.eu/"

FROM nginx:alpine
COPY --from=builder /src/public /usr/share/nginx/html
COPY nginx/default.conf /etc/nginx/conf.d/default.conf
