output "db_sg_id" {
  value = aws_security_group.database-sg.id
}

output "alb_sg_id" {
  value = aws_security_group.alb-sg.id
}

output "web_sg_id" {
  value = aws_security_group.web-tier-sg.id
}
