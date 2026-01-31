# Lambda Function Code

This directory contains the Python code for Lambda functions.

## Files

- **GETmethod.py**: Retrieves all students from DynamoDB
- **POSTmethod.py**: Adds a new student to DynamoDB

## Local Testing

```bash
# Install dependencies
pip install boto3

# Package for deployment
zip GET.zip GETmethod.py
zip POST.zip POSTmethod.py
```

## Upload to S3

```bash
aws s3 cp GET.zip s3://lambda-code6576453/GET.zip
aws s3 cp POST.zip s3://lambda-code6576453/POST.zip
```

## API Request Examples

### GET Request
```bash
curl https://your-api-id.execute-api.us-east-1.amazonaws.com/Prod/getStudent
```

### POST Request
```bash
curl -X POST https://your-api-id.execute-api.us-east-1.amazonaws.com/Prod/addStudent \
  -H "Content-Type: application/json" \
  -d '{
    "name": "John Doe",
    "email": "john@example.com",
    "course": "Computer Science"
  }'
```
