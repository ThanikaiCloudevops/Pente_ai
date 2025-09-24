variable "cluster_name" {
  description = "EKS Cluster Name"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "private_subnets" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "node_groups" {
  description = "Map of node group names to instance types and scaling config"
  type = map(object({
    instance_types = list(string)
    desired_size   = number
    max_size       = number
    min_size       = number
  }))
  default = {
    group1 = {
      instance_types = ["t3.medium"]
      desired_size   = 2
      max_size       = 3
      min_size       = 1
    }
    group2 = {
      instance_types = ["t3.medium"]
      desired_size   = 2
      max_size       = 3
      min_size       = 1
    }
  }
}
