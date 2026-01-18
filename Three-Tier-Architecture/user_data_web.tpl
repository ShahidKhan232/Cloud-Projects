#!/bin/bash
set -ex

# Log all output
exec > >(tee /var/log/user-data.log)
exec 2>&1

echo "Starting Web Tier deployment..."

# Update system
apt-get update -y
apt-get install -y git curl wget nginx ca-certificates gnupg

# Install Node.js 18.x from NodeSource
curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
apt-get install -y nodejs

# Verify Node.js installation
node --version
npm --version

# Clone application repository
cd /home/ubuntu
rm -rf app
git clone --branch two-tier-test https://github.com/AmanPathak-DevOps/Student-Teacher-Portal-Three-Tier-Application.git app
sudo chown -R ubuntu:ubuntu app
cd app/frontend

# Build frontend
echo "Installing frontend dependencies..."
npm install --verbose
echo "Building frontend..."
npm run build

# Copy frontend build to Nginx
sudo echo "Copying build files to Nginx directory..."
sudo mkdir -p /var/www/html
sudo rm -rf /var/www/html/*
sudo cp -r build/* /var/www/html/
sudo chown -R www-data:www-data /var/www/html
sudo ls -la /var/www/html/

# Configure Nginx to serve frontend and proxy API calls to App Tier
sudo cat > /etc/nginx/sites-available/default << 'NGINX_EOF'
server {
    listen 80 default_server;
    listen [::]:80 default_server;
    
    root /var/www/html;
    index index.html;
    server_name _;

    # Serve frontend static files
    location / {
        try_files $uri $uri/ /index.html;
    }

    # Proxy API calls to App Tier ALB
    location /api/ {
        proxy_pass http://${app_lb_dns}:3500/;
        proxy_http_version 1.1;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_connect_timeout 60s;
        proxy_send_timeout 60s;
        proxy_read_timeout 60s;
    }

    # Health check endpoint for ALB
    location /health {
        access_log off;
        return 200 "healthy\n";
        add_header Content-Type text/plain;
    }
}
NGINX_EOF

# Test and restart Nginx
sudo nginx -t
sudo systemctl restart nginx
sudo systemctl enable nginx

echo "Web Tier deployment completed successfully!"
