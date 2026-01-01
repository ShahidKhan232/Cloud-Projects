resource "aws_sns_topic" "Resized-Image-SNS" {
  name = var.sns-name
}

resource "aws_sns_topic_subscription" "Resized-Image-SNS-subscription" {
  topic_arn = aws_sns_topic.Resized-Image-SNS.arn
  protocol  = "email"
  endpoint  = var.mail-id
}
