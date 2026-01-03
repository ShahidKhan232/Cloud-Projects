# Cloud Projects Repository

A comprehensive collection of AWS infrastructure and application projects demonstrating cloud automation, serverless architecture, and infrastructure-as-code best practices using Terraform.

## 📁 Projects Overview

### 1. [AWS Cost Reporting](AWS-Cost-Reporting/README.md)
**Automated Daily Cost Tracking**
- Retrieves AWS billing data using Cost Explorer API
- Generates and emails daily cost reports
- Leverages EventBridge scheduling, Lambda functions, and SES
- Service-level cost breakdowns
- Infrastructure as Code with Terraform

### 2. [Deploying WordPress on AWS EC2](Deploying-WordPress-on-AWS-EC2/README.md)
**Traditional Web Application Hosting**
- Single-VM WordPress deployment on Ubuntu 22.04
- Apache, PHP, and MySQL stack
- Complete setup guide with architecture diagrams
- Manual provisioning approach
- Ideal for learning EC2 fundamentals

### 3. [S3 Static Website Deployment](S3-Static-website-Deployment/README.md)
**Secure & Scalable Static Site Hosting**
- Private S3 bucket behind CloudFront CDN
- Origin Access Control (OAC) for secure bucket access
- Route 53 DNS with alias records
- ACM SSL/TLS with DNS validation
- Complete Terraform IaC with state management

### 4. [Intelligent Image Recognition Systems with AWS](Intelligent-Image-Recognition-Systems-with-AWS/README.md)
**AI-Powered Image Analysis Pipeline**
- Serverless architecture using Lambda
- Amazon Rekognition for image analysis
- S3 event triggers for automatic processing
- SNS email notifications with analysis results
- Full Terraform IaC with security best practices

### 5. [Resize Image Using Lambda, S3, and SNS](Resize-image-using-lambda-s3-sns/README.md)
**Automated Image Processing Pipeline**
- Event-driven architecture monitoring S3 uploads
- Lambda functions for image resizing
- SNS notifications for completion alerts
- Serverless and scalable solution
- Complete Terraform infrastructure

### 6. [EBS Snapshot Cost Optimization](EBS-Snapshot-Cost-Optimization/README.md)
**Cloud Cost Management**
- Automated EBS snapshot analysis and optimization
- Lambda-based cost reporting
- Event-driven architecture
- SNS notifications for cost insights
- IAM security policies with least privilege

## 🚀 Quick Start

### Prerequisites
- AWS Account (with appropriate permissions)
- Terraform v1.0+ installed
- AWS CLI configured
- Email verified in AWS SES (for email-enabled projects)

### Deployment Steps
1. Navigate to the project folder you want to deploy
2. Read the project-specific README.md for detailed prerequisites
3. For Terraform projects:
   ```bash
   terraform init
   terraform plan
   terraform apply
   ```
4. For manual deployments (WordPress EC2), follow the README instructions

## 📊 Project Comparison

| Project | Type | Architecture | Services | IaC |
|---------|------|--------------|----------|-----|
| AWS Cost Reporting | Automation | Serverless | Lambda, EventBridge, SES | ✅ |
| WordPress on EC2 | Application | Traditional VM | EC2, RDS | ❌ |
| S3 Static Website | Hosting | CDN-based | S3, CloudFront, Route 53 | ✅ |
| Image Recognition | Processing | Serverless | Lambda, Rekognition, S3, SNS | ✅ |
| Image Resize | Processing | Serverless | Lambda, S3, SNS | ✅ |
| EBS Optimization | Automation | Serverless | Lambda, SNS, CloudWatch | ✅ |

## 🔐 Security Highlights

- **IAM Least Privilege**: All projects use minimal required permissions
- **Infrastructure as Code**: Terraform ensures consistent, auditable deployments
- **Encryption**: Data in transit and at rest where applicable
- **Secret Management**: Credentials stored securely (not in code)
- **Monitoring**: CloudWatch integration for logs and alerts

## 💰 Estimated Monthly Costs

- **AWS Cost Reporting**: < $1 (Lambda + SES)
- **WordPress EC2**: $15-30 (t3.micro + RDS)
- **S3 Static Website**: $5-15 (S3 + CloudFront)
- **Image Recognition**: $0.20 + Rekognition charges
- **Image Resize**: $0.20 + data transfer
- **EBS Optimization**: < $1

*Costs vary based on usage and configuration*

## 📚 Learning Paths

**Beginner**: Start with S3 Static Website or AWS Cost Reporting
**Intermediate**: Try Image Resize or EBS Optimization
**Advanced**: Intelligent Image Recognition System or WordPress EC2

## 🛠️ Common Tasks

### Verify Infrastructure
```bash
cd <project-folder>
terraform validate
terraform plan
```

### Destroy Resources
```bash
cd <project-folder>
terraform destroy
```

### View Logs (for Lambda projects)
```bash
# CloudWatch Logs via AWS Console
# Or use AWS CLI: aws logs tail /aws/lambda/<function-name> --follow
```

## 📝 Notes

- Each project folder contains its own `README.md` with specific setup instructions
- Terraform state files are managed per project
- Assets and diagrams are included in each project's `assets/` folder
- All projects follow AWS best practices and security guidelines


## 🔗 Resources

- [AWS Documentation](https://docs.aws.amazon.com/)
- [Terraform AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [AWS Well-Architected Framework](https://aws.amazon.com/architecture/well-architected/)

---

**Last Updated:** January 2026  


