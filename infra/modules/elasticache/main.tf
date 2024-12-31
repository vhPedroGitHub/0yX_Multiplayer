resource "aws_elasticache_subnet_group" "subnet_group" {
  name       = "${var.namespace}-cache-subnet"
  description = "Subnet group for ElastiCache"
  subnet_ids = var.subnet_ids
}

resource "aws_elasticache_replication_group" "redis_replication_group" {
  replication_group_id       = "${var.cluster_id}"
  description                = var.description
  node_type                  = var.node_type
  port                       = 6379
  parameter_group_name       = var.parameter_group_name
  snapshot_retention_limit   = var.snapshot_retention_limit
  snapshot_window            = var.snapshot_window
  subnet_group_name          = "${aws_elasticache_subnet_group.subnet_group.name}"
  automatic_failover_enabled = var.automatic_failover_enabled
  num_cache_clusters         = var.num_cache_clusters
  lifecycle {
    ignore_changes = [num_cache_clusters]
  }
  security_group_ids         = [aws_security_group.elasticache_sg.id]
}

# Security group para ElastiCache
resource "aws_security_group" "elasticache_sg" {
  name_prefix = "${var.namespace}"
  description = "Security group for ElastiCache cluster"
  vpc_id      = var.vpc_id

  # Permitir el tráfico entrante al puerto Redis
  ingress {
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}