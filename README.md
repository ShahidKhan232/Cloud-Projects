# Cloud Projects Repository

Projects in this repo are organized by folder. Each folder includes its own README and assets.

## Contents
- [Deploying WordPress on AWS EC2](Deploying%20WordPress%20on%20AWS%20EC2/README.md)
- [S3 Static website Deployment](S3%20Static%20website%20Deployment/README.md)
- [Intelligent Image Recognition System with AWS](Intelligent-Image-Recognition-Systems-with-AWS/README.md)

## Folder Overview
- **Deploying WordPress on AWS EC2/**: Single-VM WordPress on Ubuntu 22.04 with Apache, PHP, MySQL. Includes setup README and architecture/output assets.
- **S3 Static website Deployment/**: Terraform stack for private S3 static hosting behind CloudFront with OAC, Route 53 aliases, and ACM DNS-validated cert.
- **Intelligent Image Recognition Systems with AWS/**: Serverless image recognition system using Lambda, Amazon Rekognition, S3 events, and SNS email notifications. Full Terraform IaC with state management and security best practices.

## How to Use
1) Open the folder for the project you want to deploy.
2) Read the README.md inside that folder for prerequisites and steps.
3) Run the commands from the README (Terraform for the static site; manual provisioning for WordPress EC2).

## Project Details

### Deploying WordPress on AWS EC2
- README: [Deploying WordPress on AWS EC2/README.md](Deploying%20WordPress%20on%20AWS%20EC2/README.md)
- Assets: [Architecture GIF](Deploying%20WordPress%20on%20AWS%20EC2/assets/Architecture.gif), [Output screenshot](Deploying%20WordPress%20on%20AWS%20EC2/assets/Output.png)
- Notes: Basic single-instance setup; consider adding EIP, Route 53, and HTTPS via Certbot.

### S3 Static Website Deployment (Terraform)
- README: [S3 Static website Deployment/README.md](S3%20Static%20website%20Deployment/README.md)
- Stack: Private S3 bucket, CloudFront OAC, ACM cert in us-east-1, Route 53 apex and www aliases, remote state in S3 with DynamoDB lock.
- Quick start:
	```bash
	cd "S3 Static website Deployment"
	terraform init
	terraform apply -var "bucket-name=<unique>" -var "domain-name=example.com"
	```
- Output: `cloudfront_url` for CDN testing while DNS propagates.

### Intelligent Image Recognition System with AWS (Terraform + Serverless)
- README: [Intelligent-Image-Recognition-Systems-with-AWS/README.md](Intelligent-Image-Recognition-Systems-with-AWS/README.md)
- Architecture: S3 bucket → Lambda trigger → Amazon Rekognition → SNS email notifications
- Components: S3 bucket for image storage, Python 3.9 Lambda function, Rekognition API integration, SNS topic with email subscriptions, IAM roles with minimal permissions
- Stack Features:
  - Terraform Infrastructure as Code
  - Remote state with S3 backend and DynamoDB locking
  - Secured credentials via terraform.tfvars
  - Complete monitoring and logging setup
- Quick start:
	```powershell
	cd Intelligent-Image-Recognition-Systems-with-AWS
	terraform init
	terraform plan
	terraform apply
	```
- Workflow:
  1. Upload image to S3 bucket
  2. S3 event automatically triggers Lambda
  3. Lambda analyzes image with Rekognition
  4. Results sent via SNS email notification
- Assets: AWS Lambda, Amazon Rekognition, and Email notification diagrams included
