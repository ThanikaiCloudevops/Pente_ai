resource "aws_elasticache_subnet_group" "main" {
  name       = "main-cache-subnet-group"
  subnet_ids = var.private_subnets
}

resource "aws_security_group" "elasticache" {
  vpc_id = var.vpc_id

  ingress {
    from_port   = 6379
    to_port     = 6379
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
  description = "KMS key for ElastiCache encryption"
  enable_key_rotation = true
}

resource "aws_elasticache_cluster" "main" {
  cluster_id           = "main-redis"
  engine              = "redis"
  node_type           = "cache.t3.micro"
  num_cache_nodes     = 1
  parameter_group_name = "default.redis7"
  subnet_group_name   = aws_elasticache_subnet_group.main.name
  security_group_ids  = [aws_security_group.elasticache.id]
  encryption_at_rest  = true
  kms_key_id          = aws_kms_key.elasticache.arn

  tags = {
    Name = "main-redis"
  }
}