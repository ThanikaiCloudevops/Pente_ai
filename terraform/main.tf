provider "aws" {
  region = var.region
}


# 1. ECR Repository
resource "aws_ecr_repository" "this" {
  name                 = var.app_name
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}


# 2. EKS Cluster (using official AWS module)
module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "20.8.4" 

  cluster_name    = "${var.app_name}-cluster"
  cluster_version = var.cluster_version

  vpc_id  = var.vpc_id
  subnets = var.subnets 

  enable_irsa = true

  # Managed node group
  eks_managed_node_groups = {
    default = {
      desired_size = 2
      max_size     = 4
      min_size     = 1

      instance_types = ["t3.medium"]
      capacity_type  = "ON_DEMAND"
    }
  }

  tags = {
    Project = var.app_name
    Env     = var.env
  }
}

# 3. CloudWatch Log Group

resource "aws_cloudwatch_log_group" "eks_logs" {
  name              = "/eks/${var.app_name}"
  retention_in_days = var.log_retention_days
}
