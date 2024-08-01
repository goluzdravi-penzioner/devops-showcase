provider "helm" {
 kubernetes {
  host                   = aws_eks_cluster.devops-bg.endpoint
  cluster_ca_certificate = base64decode(aws_eks_cluster.devops-bg.certificate_authority[0].data)
  exec {
    api_version = "client.authentication.k8s.io/v1alpha1"
    args        = ["eks", "get-token", "--cluster-name", var.cluster_name]
    command     = "aws"
  }
 }
}

provider "kubernetes" {
  host                   = aws_eks_cluster.devops-bg.endpoint
  cluster_ca_certificate = base64decode(aws_eks_cluster.devops-bg.certificate_authority[0].data)
  exec {
    api_version = "client.authentication.k8s.io/v1alpha1"
    args        = ["eks", "get-token", "--cluster-name", var.cluster_name]
    command     = "aws"
  }
 }


