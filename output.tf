output "vpc_id" {
  description = "VPC ID created by VPC module"
  value       = module.vpc.vpc_id
}

output "public_subnets" {
  description = "Public Subnets from VPC module"
  value       = module.vpc.public_subnets
}

output "private_subnets" {
  description = "Private Subnets from VPC module"
  value       = module.vpc.private_subnets
}

output "eks_cluster_name" {
  description = "EKS Cluster Name"
  value       = module.eks.cluster_name
}

output "eks_cluster_endpoint" {
  description = "EKS Cluster Endpoint"
  value       = module.eks.cluster_endpoint
}

output "rds_endpoint" {
  description = "RDS Endpoint"
  value       = module.rds.db_endpoint
}

output "elasticache_endpoint" {
  description = "Elasticache Endpoint"
  value       = module.elasticache.cache_endpoint
}

output "s3_bucket_name" {
  description = "S3 Bucket Name"
  value       = module.s3.bucket_name
}
