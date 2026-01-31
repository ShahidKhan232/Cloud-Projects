# Trigger initial Amplify build
resource "null_resource" "trigger_amplify_build" {
  depends_on = [aws_amplify_branch.master]

  provisioner "local-exec" {
    command = "aws amplify start-job --app-id ${aws_amplify_app.my_amplify_app.id} --branch-name ${var.app_branch} --job-type RELEASE --region ${var.aws_region}"
  }

  # Trigger rebuild when branch changes
  triggers = {
    branch_id = aws_amplify_branch.master.id
  }
}

# Output Amplify app details
output "amplify_app_id" {
  value       = aws_amplify_app.my_amplify_app.id
  description = "Amplify App ID"
}

output "amplify_default_domain" {
  value       = aws_amplify_app.my_amplify_app.default_domain
  description = "Amplify Default Domain"
}

output "amplify_app_url" {
  value       = "https://${var.app_branch}.${aws_amplify_app.my_amplify_app.default_domain}"
  description = "Amplify App URL"
}
