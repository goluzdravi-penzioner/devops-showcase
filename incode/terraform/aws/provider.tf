provider "aws" {
  region = "eu-west-1"
}

provider "helm" {
  kubernetes {
    host                   = module.eks.api_endpoint
    cluster_ca_certificate = base64decode(module.eks.k8s_cluster.certificate_authority[0].data)
    exec {
      api_version = "client.authentication.k8s.io/v1alpha1"
      args        = ["eks", "get-token", "--cluster-name", var.cluster_name]
      command     = "aws"
    }
  }
}

provider "kubernetes" {
  host                   = module.eks.api_endpoint
  cluster_ca_certificate = base64decode(module.eks.k8s_cluster.certificate_authority[0].data)
  exec {
    api_version = "client.authentication.k8s.io/v1alpha1"
    args        = ["eks", "get-token", "--cluster-name", var.cluster_name]
    command     = "aws"
  }
}

terraform {
  backend "s3" {
    bucket         = "terraform-state-devopsbg"
    key            = "terraform-state"
    region         = "eu-west-1"
    dynamodb_table = "terrafor-state-lock"
  }
}

# # dynamodb table for locking the state file
# resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
#   name = "terraform-state-lock-dynamo"
#   hash_key = "LockID"
#   read_capacity = 20
#   write_capacity = 20

#   attribute {
#     name = "LockID"
#     type = "S"
#   }

#   tags {
#     Name = "DynamoDB Terraform State Lock Table"
#   }
# }