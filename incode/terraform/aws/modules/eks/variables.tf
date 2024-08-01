variable "public_subnets" {
  type = list(string)  
}

variable "private_subnets" {
  type = list(string)  
}

variable "cluster_name" {}

# variable "eks_api_whitelist" {
#   type = list(string)
#   default = ["87.116.181.52/32"]
# }

variable "existing_public_subnets" {
  type = list(string)  
}

variable "existing_private_subnets" {
  type = list(string)  
}

variable "vpc_id" {}

variable "existing_vpc" {
  description = "Set to true to use pre existing VPC and subnets"
}

variable "k8s_version" {}
variable "app_name" {
  default = "bejzik"  
}
variable "domain" {
  default = "devopsbg.name"  
}

variable "region" {}