# Cloud Projects Repository

Projects in this repo are organized by folder. Each folder includes its own guide and assets.

## Contents
- [Deploying WordPress on AWS EC2](Deploying%20WordPress%20on%20AWS%20EC2/GUIDE.md)
- [S3 Static website Deployment](S3%20Static%20website%20Deployment/GUIDE.md)

## Folder Overview
- Deploying WordPress on AWS EC2/: Single-VM WordPress on Ubuntu 22.04 with Apache, PHP, MySQL. Includes setup guide and architecture/output assets.
- S3 Static website Deployment/: Terraform stack for private S3 static hosting behind CloudFront with OAC, Route 53 aliases, and ACM DNS-validated cert.

## How to Use
1) Open the folder for the project you want to deploy.
2) Read the GUIDE.md inside that folder for prerequisites and steps.
3) Run the commands from the guide (Terraform for the static site; manual provisioning for WordPress EC2).

## Project Details

### Deploying WordPress on AWS EC2
- Guide: [Deploying WordPress on AWS EC2/GUIDE.md](Deploying%20WordPress%20on%20AWS%20EC2/GUIDE.md)
- Assets: [Architecture GIF](Deploying%20WordPress%20on%20AWS%20EC2/assets/Architecture.gif), [Output screenshot](Deploying%20WordPress%20on%20AWS%20EC2/assets/Output.png)
- Notes: Basic single-instance setup; consider adding EIP, Route 53, and HTTPS via Certbot.

### S3 Static Website Deployment (Terraform)
- Guide: [S3 Static website Deployment/GUIDE.md](S3%20Static%20website%20Deployment/GUIDE.md)
- Stack: Private S3 bucket, CloudFront OAC, ACM cert in us-east-1, Route 53 apex and www aliases, remote state in S3 with DynamoDB lock.
- Quick start:
	```bash
	cd "S3 Static website Deployment"
	terraform init
	terraform apply -var "bucket-name=<unique>" -var "domain-name=example.com"
	```
- Output: `cloudfront_url` for CDN testing while DNS propagates.
