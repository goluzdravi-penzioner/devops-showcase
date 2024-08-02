resource "aws_elasticache_cluster" "example" {
  cluster_id           = var.redis_cluster_name
  engine               = "redis"
  node_type            = var.redis_node_type
  num_cache_nodes      = var.redis_nodes
  parameter_group_name = "default.redis3.2"
  engine_version       = var.redis_engine_version
  port                 = 6379
  security_group_ids   = aws_security_group.allow_redis.id 
  subnet_group_name    = aws_elasticache_subnet_group.redis-sg.name
   
}

resource "aws_elasticache_subnet_group" "redis-sg" {
  name       = "eks-subnets"
  subnet_ids = module.vpc.private_subnets
}