# AWS region
region = "us-east-1"

# Application name
app_name = "my-microservice"

# Deployment environment
env = "dev"

# EKS cluster version
cluster_version = "1.29"

# VPC where EKS will be deployed
vpc_id = "vpc-0123456789abcdef0"

# Subnets for the EKS worker nodes (can be public or private)
subnets = [
  "subnet-0123456789abcdef1",
  "subnet-0123456789abcdef2"
]

# CloudWatch log retention period in days
log_retention_days = 7
