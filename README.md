# Cloud Projects Repository

Projects in this repo are organized by folder. Each folder includes its own README and assets.

## Contents
- [Deploying WordPress on AWS EC2](Deploying-WordPress-on-AWS-EC2/README.md)
- [S3 Static website Deployment](S3-Static-website-Deployment/README.md)
- [Intelligent Image Recognition System with AWS](Intelligent-Image-Recognition-Systems-with-AWS/README.md)
- [Resize Image Using Lambda, S3, and SNS](Resize-image-using-lambda-s3-sns/README.md)
- [EBS Snapshot Cost Optimization](EBS-Snapshot-Cost-Optimization/README.md)

## Folder Overview
- **Deploying WordPress on AWS EC2/**: Single-VM WordPress on Ubuntu 22.04 with Apache, PHP, MySQL. Includes setup README and architecture/output assets.
- **S3 Static website Deployment/**: Terraform stack for private S3 static hosting behind CloudFront with OAC, Route 53 aliases, and ACM DNS-validated cert.
- **Intelligent Image Recognition Systems with AWS/**: Serverless image recognition system using Lambda, Amazon Rekognition, S3 events, and SNS email notifications. Full Terraform IaC with state management and security best practices.
- **Resize Image Using Lambda, S3, and SNS/**: Automated image resizing pipeline that monitors S3 buckets, triggers Lambda functions, and sends email notifications via SNS. Serverless architecture with Terraform IaC.
- **EBS Snapshot Cost Optimization/**: Automated cost optimization system using Lambda functions to analyze and manage EBS snapshots. Event-driven architecture with SNS notifications for cost reports. Full Terraform IaC with IAM security policies.

## How to Use
1) Open the folder for the project you want to deploy.
2) Read the README.md inside that folder for prerequisites and steps.
3) Run the commands from the README (Terraform for the static site; manual provisioning for WordPress EC2).
