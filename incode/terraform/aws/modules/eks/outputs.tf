output "api_endpoint" {
  value = aws_eks_cluster.devops-bg.endpoint
}

output "kubeconfig_certificate_authority_data" {
  value = aws_eks_cluster.devops-bg.certificate_authority[0].data
}

output "k8s_cluster" {
  value = aws_eks_cluster.devops-bg
}
