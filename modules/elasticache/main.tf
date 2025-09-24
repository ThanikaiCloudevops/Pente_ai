resource "aws_elasticache_subnet_group" "main" {
  name       = "main-cache-subnet-group"
  subnet_ids = var.private_subnets
}

resource "aws_security_group" "elasticache" {
  vpc_id = var.vpc_id

  ingress {
    from_port   = var.cache_port
    to_port     = var.cache_port
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "elasticache-sg"
  }
}

resource "aws_kms_key" "elasticache" {
  description         = "KMS key for ElastiCache encryption"
  enable_key_rotation = true
}

resource "aws_elasticache_replication_group" "main" {
  replication_group_id          = var.replication_group_id
  description                   = var.description

  node_type                    = var.redis_node_type
  num_node_groups              = var.num_node_groups
  replicas_per_node_group      = var.replicas_per_node_group

  subnet_group_name            = aws_elasticache_subnet_group.main.name
  security_group_ids           = [aws_security_group.elasticache.id]

  automatic_failover_enabled   = var.automatic_failover_enabled
  engine                      = "redis"
  engine_version              = var.engine_version

  at_rest_encryption_enabled   = true
  transit_encryption_enabled   = true
  kms_key_id                   = aws_kms_key.elasticache.arn

  tags = {
    Name = var.replication_group_id
  }
}
