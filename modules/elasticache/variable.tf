variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "private_subnets" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "redis_node_type" {
  description = "Redis node instance type"
  type        = string
  default     = "cache.t3.micro"
}

variable "cache_port" {
  description = "Redis cache port"
  type        = number
  default     = 6379
}

variable "engine_version" {
  description = "Redis engine version (use major.minor format, e.g., 7.0)"
  type        = string
  default     = "7.0"
}

variable "replication_group_id" {
  description = "ElastiCache replication group id"
  type        = string
  default     = "main-redis"
}

variable "description" {
  description = "Replication group description"
  type        = string
  default     = "Main Redis replication group"
}

variable "automatic_failover_enabled" {
  description = "Enable automatic failover"
  type        = bool
  default     = false
}

variable "num_node_groups" {
  description = "Number of node groups (shards)"
  type        = number
  default     = 1
}

variable "replicas_per_node_group" {
  description = "Number of replicas per node group"
  type        = number
  default     = 0
}
