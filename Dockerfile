FROM nginx:alpine
RUN apk add --no-cache curl
COPY public /usr/share/nginx/html
COPY nginx/default.conf /etc/nginx/conf.d/default.conf
COPY docker-entrypoint.d/purge-cloudflare-cache.sh /docker-entrypoint.d/20-purge-cloudflare-cache.sh
RUN chmod +x /docker-entrypoint.d/20-purge-cloudflare-cache.sh
