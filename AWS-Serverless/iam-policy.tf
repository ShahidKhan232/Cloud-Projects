resource "aws_iam_role_policy" "lambda-policy" {
  name = var.policy-1
  role = aws_iam_role.iam_role_lambda.id


  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "logs:CreateLogGroup"
        ]
        Effect   = "Allow"
        Resource = "arn:aws:logs:${var.aws_region}:*:log-group:/aws/lambda/${var.function_name_GET}:*"
      },
      {
        Action = [
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "logs:CreateLogGroup"
        ]
        Effect   = "Allow"
        Resource = "arn:aws:logs:${var.aws_region}:*:log-group:/aws/lambda/${var.function_name_POST}:*"
      },
      {
        Action = [
          "dynamodb:PutItem",
          "dynamodb:DeleteItem",
          "dynamodb:GetItem",
          "dynamodb:Scan",
          "dynamodb:Query",
          "dynamodb:UpdateItem"
        ]
        Effect   = "Allow"
        Resource = aws_dynamodb_table.Student-Details-db.arn
      },
    ]
  })
}

resource "aws_iam_role_policy" "amplify-policy" {
  name = var.policy-2
  role = aws_iam_role.iam_role_amplify.id


  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid = "AmplifyCloudWatchLogs"
        Action = [
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "logs:CreateLogGroup",
          "logs:DescribeLogGroups"
        ]
        Effect   = "Allow"
        Resource = "arn:aws:logs:${var.aws_region}:*:log-group:/aws/amplify/*"
      },
      {
        Sid = "AmplifyCodeCommitAccess"
        Action = [
          "codecommit:GitPull",
          "codecommit:GetBranch",
          "codecommit:GetCommit",
          "codecommit:GetRepository",
          "codecommit:ListBranches"
        ]
        Effect   = "Allow"
        Resource = "arn:aws:codecommit:${var.aws_region}:*:Serverless-Project"
      },
    ]
  })
}