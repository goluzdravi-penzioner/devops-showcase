variable "region" {
  default = "eu-west-1"
}

variable "subnet_numbers" {
  type = map(any)
}

variable "cidr_block" {}
variable "cidr_public_subnets" {}
variable "cidr_private_subnets" {}

variable "cluster_name" {
  default = "devopsbg"
}

variable "k8s_version" {
  default = "1.30"
}

variable "rds_storage" {
  type = number
}

variable "rds_db_name" {
  type = string
}

variable "rds_engine_version" {
  type = string
}

variable "rds_instance_class" {
  type = string
}

variable "rds_db_username" {
  type = string
}

variable "redis_cluster_name" {
  type = string
}

variable "redis_node_type" {
  type = string
}

variable "redis_nodes" {
  type = number
}

variable "redis_engine_version" {
  type = string
}

###
