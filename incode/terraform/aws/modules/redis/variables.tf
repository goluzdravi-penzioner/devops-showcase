variable "redis_cluster_name" {
  type = string
}

variable "redis_node_type" {
  type = string
}

variable "redis_nodes" {
  type = number
}

# variable "redis_engine_version" {
#   type = string
# }

variable "cidr_private_subnets" {}

variable "private_subnet_ids" {
  type = list
}

variable "vpc_id" {
  type = string
}