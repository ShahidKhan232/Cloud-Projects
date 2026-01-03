resource "aws_ses_email_identity" "send-mail" {
  email = "shahidkhan.95173@gmail.com"
}

resource "aws_ses_email_identity" "receiver-mail" {
  email = "shahidkhan.95173@gmail.com"
}