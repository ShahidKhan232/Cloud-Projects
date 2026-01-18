#!/bin/bash
set -ex

# Log all output
exec > >(tee /var/log/user-data.log)
exec 2>&1

echo "Starting App Tier deployment..."

# Update system
apt-get update -y
apt-get install -y git curl wget ca-certificates gnupg

# Install Node.js 18.x from NodeSource
curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
apt-get install -y nodejs

# Verify Node.js installation
node --version
npm --version

# Install PM2 globally
npm install -g pm2

# Clone application repository
cd /home/ubuntu
rm -rf app
git clone --branch two-tier-test https://github.com/AmanPathak-DevOps/Student-Teacher-Portal-Three-Tier-Application.git app
sudo chown -R ubuntu:ubuntu app
cd app/backend

# Install backend dependencies
echo "Installing backend dependencies..."
npm install --verbose

# Create .env file with database connection details
cat > .env << ENV_EOF
DB_HOST=${db_host}
DB_NAME=${db_name}
DB_USER=${db_user}
DB_PASSWORD=${db_password}
DB_PORT=3306
PORT=3500
ENV_EOF

# Set proper permissions
chown -R ubuntu:ubuntu /home/ubuntu/app

# Start backend with PM2 as ubuntu user
echo \"Starting backend with PM2...\"\ncd /home/ubuntu/app/backend\nsudo -u ubuntu bash << 'UBUNTU_EOF'\nexport HOME=/home/ubuntu\ncd /home/ubuntu/app/backend\npm2 start server.js --name \"backend-api\"\npm2 save\nUBUNTU_EOF\n\n# Setup PM2 to start on boot\npm2 startup systemd -u ubuntu --hp /home/ubuntu\nsystemctl enable pm2-ubuntu\n\necho \"Verifying backend is running...\"\nsleep 5\nsudo -u ubuntu pm2 status\n\necho \"App Tier deployment completed successfully!\"
