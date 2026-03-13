#!/bin/sh
# Support reading secrets from files (e.g. Docker secrets)
if [ -n "$CF_ZONE_ID_FILE" ] && [ -r "$CF_ZONE_ID_FILE" ]; then
    CF_ZONE_ID=$(cat "$CF_ZONE_ID_FILE")
fi
if [ -n "$CF_API_TOKEN_FILE" ] && [ -r "$CF_API_TOKEN_FILE" ]; then
    CF_API_TOKEN=$(cat "$CF_API_TOKEN_FILE")
fi

if [ -n "$CF_ZONE_ID" ] && [ -n "$CF_API_TOKEN" ]; then
    echo "Purging Cloudflare cache..."
    curl -X POST "https://api.cloudflare.com/client/v4/zones/$CF_ZONE_ID/purge_cache" \
        -H "Authorization: Bearer $CF_API_TOKEN" \
        -H "Content-Type: application/json" \
        -d '{"purge_everything":true}' || echo "Warning: Cloudflare cache purge failed"
fi
