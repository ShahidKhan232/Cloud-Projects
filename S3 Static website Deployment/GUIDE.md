# S3 Static Website Deployment (Terraform)

This guide walks through deploying the bundled static site to S3 behind CloudFront with DNS and TLS via Route 53 and ACM. The Terraform in this folder creates:
- Private S3 bucket for content, uploaded via a local `aws s3 sync`
- CloudFront distribution with Origin Access Control (OAC)
- ACM certificate (DNS validated) in `us-east-1`
- Route 53 A/ALIAS records for apex and `www` pointing at CloudFront

## Prerequisites
- AWS account with a registered domain in Route 53 (public hosted zone)
- AWS CLI configured with credentials/region
- Terraform ≥ 0.13
- Remote state backend already created: S3 bucket `my-ews-baket1` and DynamoDB table `Lock-Files` (adjust in [backend.tf](backend.tf#L1-L11) if different)

## What to configure
1) Set names and domain in [variables.tf](variables.tf#L1-L8):
	- `bucket-name`: unique S3 bucket name
	- `domain-name`: your apex domain (e.g., `example.com`)
2) Ensure the AWS provider region matches your choice in [provider.tf](provider.tf#L1-L4) and the ACM/Route 53 resources (they are pinned to `us-east-1`).
3) Optional: replace the website content under `website/` before deploying.

## Architecture
- Private S3 bucket hosts static assets; objects are uploaded via local `aws s3 sync` in [bucket-creation.tf](bucket-creation.tf#L1-L40).
- CloudFront with Origin Access Control serves as CDN and enforces HTTPS; distribution is defined in [cloudfront-distribution.tf](cloudfront-distribution.tf#L1-L54).
- ACM certificate (DNS validated) in `us-east-1` for TLS termination at CloudFront; created in [certificate.tf](certificate.tf#L1-L18).
- Route 53 aliases for apex and `www` to CloudFront; CNAMEs for ACM validation; managed in [route53.tf](route53.tf#L1-L43).
- Terraform remote state stored in S3 with DynamoDB locking; backend configured in [backend.tf](backend.tf#L1-L11).

## Deploy steps
1) Install dependencies
	- AWS CLI: https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
	- Terraform: https://developer.hashicorp.com/terraform/downloads

2) Initialize
	```bash
	terraform init
	```

3) Review plan (update values as needed)
	```bash
	terraform plan \
	  -var "bucket-name=your-unique-bucket" \
	  -var "domain-name=example.com"
	```

4) Apply
	```bash
	terraform apply \
	  -var "bucket-name=your-unique-bucket" \
	  -var "domain-name=example.com"
	```
	- Terraform will upload everything in `website/` via the `null_resource` in [bucket-creation.tf](bucket-creation.tf#L1-L40).
	- Wait for ACM DNS validation and CloudFront provisioning (can take ~15–20 minutes).

5) Verify
	- Outputs will include the CloudFront URL.
	- Browse the domain and `www` hostnames once the Route 53 aliases propagate.

## Updating content
- Replace files under `website/`, then rerun `terraform apply` to sync changes.
- Alternatively, sync manually: `aws s3 sync website s3://<bucket-name>` (bucket stays private; CloudFront OAC handles access).

## Destroy
```bash
terraform destroy \
  -var "bucket-name=your-unique-bucket" \
  -var "domain-name=example.com"
```
The bucket uses `force_destroy = true` in [bucket-creation.tf](bucket-creation.tf#L1-L40) so teardown removes all objects.

## Outputs
- `cloudfront_url`: CDN domain from [cloudfront-distribution.tf](cloudfront-distribution.tf#L56-L58).

## Troubleshooting
- ACM validation pending: check CNAMEs created in Route 53 from [route53.tf](route53.tf#L1-L43).
- CloudFront 403: ensure OAC is attached and S3 bucket policy matches [bucket-creation.tf](bucket-creation.tf#L17-L39).
- Slow propagation: CloudFront and DNS may take several minutes; retry after caching expires.
