resource "aws_eks_cluster" "devops-bg" {
  depends_on = [ aws_iam_role_policy_attachment.AmazonEKSClusterPolicy]

  name     = var.cluster_name
  role_arn = aws_iam_role.eks_cluster.arn
  version = var.k8s_version

  vpc_config {
    subnet_ids = local.subnet_ids
    security_group_ids = [ aws_security_group.ControlPlaneSecurityGroup.id ]
  }
}

resource "aws_iam_role" "eks_cluster" {
  name = "eks-cluster-role"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks_cluster.name
}

locals {
  subnet_ids = var.existing_vpc == true ? var.existing_public_subnets : var.public_subnets
}

resource "aws_iam_openid_connect_provider" "oidc" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = ["9e99a48a9960b14926bb7f3b02e22da2b0ab7280"]
  url             = aws_eks_cluster.devops-bg.identity.0.oidc.0.issuer
}

locals {
  oidc = {
    arn = aws_iam_openid_connect_provider.oidc.arn
    url = replace(aws_iam_openid_connect_provider.oidc.url, "https://", "")
  }
}