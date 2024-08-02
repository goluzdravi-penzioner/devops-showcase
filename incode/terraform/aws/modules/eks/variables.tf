variable "public_subnets" {
  type = list(string)  
}

variable "private_subnets" {
  type = list(string)  
}

variable "cluster_name" {}
variable "vpc_id" {}
variable "k8s_version" {}
variable "region" {}