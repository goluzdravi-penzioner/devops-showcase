output "redis_host" {
  value = aws_elasticache_cluster.example.cluster_address
}