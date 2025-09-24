output "replication_group_id" {
  description = "The replication group ID of the Redis cluster"
  value       = aws_elasticache_replication_group.main.replication_group_id
}

output "primary_endpoint_address" {
  description = "Primary endpoint address for the Redis replication group"
  value       = aws_elasticache_replication_group.main.primary_endpoint_address
}

output "reader_endpoint_address" {
  description = "Reader endpoint address for the Redis replication group (if any)"
  value       = aws_elasticache_replication_group.main.reader_endpoint_address
}

output "kms_key_arn" {
  description = "KMS Key ARN used for encryption"
  value       = aws_kms_key.elasticache.arn
}

output "security_group_id" {
  description = "Security group ID associated with ElastiCache"
  value       = aws_security_group.elasticache.id
}

output "subnet_group_name" {
  description = "Subnet group name used by ElastiCache"
  value       = aws_elasticache_subnet_group.main.name
}
output "cache_endpoint" {
  description = "Elasticache primary endpoint"
  value       = aws_elasticache_replication_group.main.primary_endpoint_address
}
