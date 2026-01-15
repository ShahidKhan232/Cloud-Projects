output "instance_profile_name" {
  value = aws_iam_instance_profile.test_profile.name
}

output "instance_profile_arn" {
  value = aws_iam_instance_profile.test_profile.arn
}

output "iam_role_arn" {
  value = aws_iam_role.iam-role.arn
}
