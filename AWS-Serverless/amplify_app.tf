resource "aws_amplify_app" "my_amplify_app" {
  name       = var.app_name
  repository = var.app_repo

  iam_service_role_arn = aws_iam_role.iam_role_amplify.arn

  # Build specification for static website
  build_spec = <<-EOT
    version: 1
    frontend:
      phases:
        preBuild:
          commands:
            - echo "Preparing build environment"
        build:
          commands:
            - echo "Building static website"
      artifacts:
        baseDirectory: /
        files:
          - '**/*'
      cache:
        paths: []
  EOT

  # Environment variables for the build
  environment_variables = {
    ENV = "production"
  }

  # Enable auto branch creation from Git
  enable_auto_branch_creation = false
  enable_branch_auto_build    = true
  enable_branch_auto_deletion = false

  # Custom rules for SPA routing
  custom_rule {
    source = "/<*>"
    status = "404"
    target = "/index.html"
  }

  depends_on = [aws_api_gateway_deployment.student_api_deployment]
}


resource "aws_amplify_branch" "master" {
  app_id      = aws_amplify_app.my_amplify_app.id
  branch_name = var.app_branch

  enable_auto_build = true
  stage             = "PRODUCTION"

  depends_on = [aws_amplify_app.my_amplify_app]
}

# Domain association commented out to avoid CNAME conflicts with CloudFront
# Use CloudFront distribution for domain management instead
# resource "aws_amplify_domain_association" "example" {
#   app_id      = aws_amplify_app.my_amplify_app.id
#   domain_name = var.app_domain_name
#
#   sub_domain {
#     branch_name = aws_amplify_branch.master.branch_name
#     prefix      = ""
#   }
#
#   sub_domain {
#     branch_name = aws_amplify_branch.master.branch_name
#     prefix      = "www"
#   }
#
#   wait_for_verification = true
#
#   depends_on = [aws_amplify_app.my_amplify_app]
# }