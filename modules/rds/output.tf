output "rds_endpoint" {
  value = aws_db_instance.main.endpoint
}
output "db_endpoint" {
  description = "RDS endpoint"
  value       = aws_db_instance.main.endpoint
}