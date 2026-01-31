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

### 7. [Two-Tier Architecture](Two-Tier-Architecture/README.md)
**Production-Ready High-Availability Application Infrastructure**
- Multi-AZ deployment with Auto Scaling
- Aurora MySQL RDS cluster with read replicas
- Application Load Balancer with health checks
- CloudFront CDN with Route53 and ACM
- Complete infrastructure automation with modular Terraform
- WAF protection and security best practices
- CloudWatch monitoring and auto-scaling policies

### 8. [Three-Tier Architecture](Three-Tier-Architecture/README.md)
**Enterprise-Grade Web, App, and Database Stack**
- VPC with public and private subnets across multiple AZs
- Auto Scaling groups for web and app tiers behind ALB
- RDS MySQL multi-AZ with read replica option
- CloudFront, WAF, ACM, and Route53 for secure global delivery
- Modular Terraform with reusable network, security, and compute components

### 9. [AWS Serverless Application](AWS-Serverless/README.md)
**Full-Stack Serverless Student Management System**
- Complete serverless architecture with Lambda and DynamoDB
- API Gateway REST API with CORS support
- AWS Amplify frontend hosting with CodeCommit integration
- CloudFront CDN with Route53 and ACM for custom domain
- Automated CI/CD pipeline with auto-build on commits
- Scoped IAM policies with least privilege
- CloudWatch logging and monitoring
- Infrastructure as Code with comprehensive Terraform

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
| Two-Tier Architecture | Application | Highly Available | VPC, EC2, RDS, ALB, CloudFront | ✅ |
| Three-Tier Architecture | Application | Web + App + DB | VPC, EC2, ALB, RDS, CloudFront, WAF | ✅ |
| AWS Serverless | Full-Stack App | Serverless | Lambda, API Gateway, DynamoDB, Amplify, CodeCommit, CloudFront | ✅ |

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
- **AWS Serverless**: $2-10 (Lambda, API Gateway, DynamoDB on-demand, Amplify, CloudFront)
- **EBS Optimization**: < $1
- **Two-Tier Architecture**: $150-250 (RDS db.r5.large, ALB, NAT, EC2, CloudFront)
- **Three-Tier Architecture**: $250-400 (additional app tier ASG + network egress)

*Costs vary based on usage and configuration*

## 📚 Learning Paths

**Beginner**: Start with S3 Static Website or AWS CostWordPress EC2, or AWS Serverless
**Intermediate**: Try Image Resize, EBS Optimization, or WordPress EC2  
**Advanced**: Intelligent Image Recognition System, Two-Tier Architecture, or Three-Tier Architecture

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


