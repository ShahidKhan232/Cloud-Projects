# Cloud Projects Repository

Welcome to the **Cloud Project Repository**, which showcases various cloud-based solutions implemented using AWS. This repository contains solutions to common cloud challenges, covering areas such as hosting, scaling, security, and cost optimization.

## Table of Contents

- [Project Overview](#project-overview)
- [Deploying WordPress on AWS EC2](#deploying-wordpress-on-aws-ec2)
- [Features](#features)
- [Technologies Used](#technologies-used)
- [Setup and Deployment](#setup-and-deployment)
- [Contributing](#contributing)
- [License](#license)


## Project Overview

This repository currently focuses on deploying WordPress on AWS EC2 (Ubuntu 22.04) using Apache, PHP, and MySQL. See the featured section below and the full guide: [Deploying WordPress on AWS EC2/GUIDE.md](Deploying%20WordPress%20on%20AWS%20EC2/GUIDE.md).

## Technologies Used

- **AWS Services:** S3, EC2, Auto Scaling, RDS, IAM, CloudFront, Lambda, DynamoDB, AWS Backup, AWS EBS, AWS ELB.
- **Infrastructure as Code:** AWS CloudFormation, Terraform.
- **Scripting & Automation:** Python, Bash scripting.
- **Security & Compliance:** IAM policies, security groups, encryption.

## Setup and Deployment

1. Clone this repository:
   ```sh
   git clone https://github.com/ShahidKhan232/cloud-project.git
   ```
2. Navigate to the project directory:
   ```sh
   cd cloud-project
   ```
3. Follow individual project setup guides available in their respective folders.
4. Deploy AWS services using provided Terraform/CloudFormation scripts.
5. Monitor and optimize resources using AWS CloudWatch and Cost Explorer.

## Contributing

Contributions are welcome! If you have ideas for improvements, please open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE). Feel free to use and modify as needed.

---

Feel free to explore, learn, and contribute to this cloud journey! 🚀

---

## Deploying WordPress on AWS EC2

Beginner-friendly deployment of WordPress on a single AWS EC2 (Ubuntu 22.04) instance using Apache, PHP, and MySQL.

- Guide: [Deploying WordPress on AWS EC2/GUIDE.md](Deploying%20WordPress%20on%20AWS%20EC2/GUIDE.md)
- Architecture:

![Architecture Overview](Deploying%20WordPress%20on%20AWS%20EC2/assets/Architecture.gif)

- Quick Start:

```bash
ssh -i key.pem ubuntu@<EC2_PUBLIC_IP>
```

Open in browser after setup:

```text
http://<EC2_PUBLIC_IP>/wordpress/
```

- Ports: 22 (SSH), 80 (HTTP), 443 (HTTPS)
- Optional: Elastic IP, Route 53, HTTPS via Certbot

Screenshots:

![WordPress Output](Deploying%20WordPress%20on%20AWS%20EC2/assets/Output.png)
