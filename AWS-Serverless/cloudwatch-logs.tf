resource "aws_cloudwatch_log_group" "lambda_log_group_get" {
  name              = "/aws/lambda/${var.function_name_GET}"
  retention_in_days = 14

  tags = {
    Name        = "GET Lambda Log Group"
    Environment = "Production"
  }
}

resource "aws_cloudwatch_log_group" "lambda_log_group_post" {
  name              = "/aws/lambda/${var.function_name_POST}"
  retention_in_days = 14

  tags = {
    Name        = "POST Lambda Log Group"
    Environment = "Production"
  }
}
