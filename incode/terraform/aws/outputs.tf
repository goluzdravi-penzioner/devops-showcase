
output "vpc_id" {
  description = "VPC id"
  value       = module.vpc.vpc_id
}

output "public_subnets" {
  description = "List of public subnet ids"
  value       = module.vpc.public_subnets
}

output "private_subnets" {
  description = "List of private subnet ids"
  value       = module.vpc.private_subnets
}

output "eks_api_endpoint" {
  value = module.eks.api_endpoint
}

output "kubeconfig_certificate_authority_data" {
  value = module.eks.kubeconfig_certificate_authority_data
}

output "k8s_cluster_info" {
  value = module.eks.k8s_cluster
}

output "helm" {
  value = module.apps.helm
  sensitive = false
}

