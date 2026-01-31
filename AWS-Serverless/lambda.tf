resource "aws_lambda_function" "GET_lambda" {
  function_name = var.function_name_GET
  role          = aws_iam_role.iam_role_lambda.arn
  handler       = var.GET_lambda_handler
  runtime       = var.lambda_runtime
  timeout       = var.lambda_timeout
  memory_size   = var.lambda_memory_size
  s3_bucket     = aws_s3_bucket.lambda_code_bucket.id
  s3_key        = var.GET_function_file

  depends_on = [
    aws_cloudwatch_log_group.lambda_log_group_get,
    aws_s3_bucket.lambda_code_bucket
  ]
}

resource "aws_lambda_function" "POST_lambda" {
  function_name = var.function_name_POST
  role          = aws_iam_role.iam_role_lambda.arn
  handler       = var.POST_lambda_handler
  runtime       = var.lambda_runtime
  timeout       = var.lambda_timeout
  memory_size   = var.lambda_memory_size
  s3_bucket     = aws_s3_bucket.lambda_code_bucket.id
  s3_key        = var.POST_function_file

  depends_on = [
    aws_cloudwatch_log_group.lambda_log_group_post,
    aws_s3_bucket.lambda_code_bucket
  ]
}