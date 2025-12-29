# 🚀 Deploying WordPress on AWS EC2 (Ubuntu 22.04)

This project demonstrates a beginner-friendly deployment of WordPress on an AWS EC2 instance using Apache, PHP, and MySQL on a single server.
It is ideal for learning cloud fundamentals, Linux server configuration, and basic DevOps practices.

---

## 📌 Architecture Overview

- Cloud Provider: AWS
- Compute: EC2 (t2.micro)
- OS: Ubuntu 22.04 LTS
- Web Server: Apache2
- Database: MySQL (local)
- Application: WordPress
- Networking: Security Groups (Ports 22, 80, 443)
- Optional: Elastic IP, Route 53, HTTPS (Certbot)

![Architecture Overview](assets/Architecture.gif)


---

## 🧰 Prerequisites

- AWS Account
- Basic Linux command knowledge
- SSH client (Linux / macOS / Git Bash)
- Optional: Domain name (for Route 53 + HTTPS)

---

## 🛠️ Step-by-Step Deployment

### 1️⃣ Launch EC2 Instance

- AMI: Ubuntu 22.04
- Instance Type: t2.micro
- Security Group:
  - SSH (22)
  - HTTP (80)
  - HTTPS (443)

---

### 2️⃣ Connect to EC2

```bash
ssh -i key.pem ubuntu@<EC2_PUBLIC_IP>
```

---

### 3️⃣ Install Apache

```bash
sudo apt update
sudo apt install apache2 -y
sudo systemctl enable apache2
sudo systemctl start apache2
```

Verify in browser:

```
http://<EC2_PUBLIC_IP>
```

---

### 4️⃣ Install PHP & Required Extensions

```bash
sudo apt install -y \
  php \
  libapache2-mod-php \
  php-mysql \
  php-curl \
  php-gd \
  php-mbstring \
  php-xml \
  php-zip \
  php-intl

sudo systemctl restart apache2
```

---

### 5️⃣ Install & Configure MySQL

```bash
sudo apt install mysql-server -y
sudo mysql
```

Create database and user:

```sql
CREATE DATABASE Shahid;
CREATE USER 'Shahid_new'@'localhost' IDENTIFIED WITH mysql_native_password BY 'Shahid@123DevOps';
GRANT ALL PRIVILEGES ON Shahid.* TO 'Shahid_new'@'localhost';
FLUSH PRIVILEGES;
EXIT;
```

Verify login:

```bash
mysql -u Shahid_new -p Shahid
```

---

### 6️⃣ Install WordPress

```bash
cd /tmp
wget https://wordpress.org/latest.zip
unzip latest.zip
sudo mv wordpress /var/www/html/
```

Set permissions:

```bash
sudo chown -R www-data:www-data /var/www/html/wordpress
sudo chmod -R 755 /var/www/html/wordpress
```

---

### 7️⃣ Configure WordPress

```bash
cd /var/www/html/wordpress
sudo cp wp-config-sample.php wp-config.php
sudo nano wp-config.php
```

Update database settings in `wp-config.php`:

```php
define('DB_NAME', 'Shahid');
define('DB_USER', 'Shahid_new');
define('DB_PASSWORD', 'Shahid@123DevOps');
define('DB_HOST', '127.0.0.1');
```

---

### 8️⃣ Access WordPress

Open in browser:

```
http://<EC2_PUBLIC_IP>/wordpress/
```

Complete the WordPress installation wizard 🎉

![WordPress Output](assets/Output.png)

---

## 🌐 Optional Enhancements

- Elastic IP: Assign a static public IP to EC2
- Custom Domain (Route 53):
  - Create a Hosted Zone
  - Add A & CNAME records
- HTTPS (Certbot):

```bash
sudo apt install certbot python3-certbot-apache -y
sudo certbot --apache
```

---

## 🧪 Troubleshooting

- MySQL Access Denied:

```bash
sudo mysql -e "ALTER USER 'Shahid_new'@'localhost' IDENTIFIED WITH mysql_native_password BY 'Shahid@123DevOps'; FLUSH PRIVILEGES;"
```

- Apache Logs:

```bash
sudo tail -f /var/log/apache2/error.log
```

---

## 📚 Key Learnings

- AWS EC2 provisioning
- Linux server administration
- Apache + PHP configuration
- MySQL authentication (MySQL 8)
- WordPress deployment & troubleshooting
- Cloud networking basics
