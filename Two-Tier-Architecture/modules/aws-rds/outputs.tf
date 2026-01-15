output "rds_cluster_endpoint" {
  value = aws_rds_cluster.aurora_cluster.endpoint
}

output "rds_cluster_reader_endpoint" {
  value = aws_rds_cluster.aurora_cluster.reader_endpoint
}

output "rds_cluster_id" {
  value = aws_rds_cluster.aurora_cluster.id
}

output "rds_cluster_arn" {
  value = aws_rds_cluster.aurora_cluster.arn
}
