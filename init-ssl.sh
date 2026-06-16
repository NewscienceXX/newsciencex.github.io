#!/bin/bash
# Run once on first deploy to bootstrap SSL certificates.
# After this, certs auto-renew via the certbot container.

set -e

DOMAIN="newsciencex.com"
EMAIL="alex@dsc-labs.io"
CERT_PATH="/etc/letsencrypt/live/$DOMAIN"

echo "==> Step 1: Start nginx with HTTP only (for ACME challenge)"

# Temporarily use an HTTP-only config so nginx can start without certs
cat > /tmp/nginx-init.conf << 'EOF'
server {
    listen 80;
    server_name newsciencex.com www.newsciencex.com;

    location /.well-known/acme-challenge/ {
        root /var/www/certbot;
    }

    location / {
        return 200 'ok';
        add_header Content-Type text/plain;
    }
}
EOF

docker run -d --rm --name nginx-init \
  -p 80:80 \
  -v "$(pwd)":/usr/share/nginx/html:ro \
  -v /tmp/nginx-init.conf:/etc/nginx/conf.d/default.conf:ro \
  -v newsciencex_certbot-www:/var/www/certbot \
  nginx:alpine

echo "==> Step 2: Obtain SSL certificate via Let's Encrypt"
docker run --rm \
  -v newsciencex_certbot-www:/var/www/certbot \
  -v newsciencex_certbot-conf:/etc/letsencrypt \
  certbot/certbot certonly --webroot \
    --webroot-path=/var/www/certbot \
    --email "$EMAIL" \
    --agree-tos \
    --no-eff-email \
    -d "$DOMAIN" \
    -d "www.$DOMAIN"

echo "==> Step 3: Stop temporary nginx"
docker stop nginx-init

echo "==> Step 4: Start full stack with HTTPS"
docker compose up -d --build

echo ""
echo "Done! Site is live at https://$DOMAIN"
