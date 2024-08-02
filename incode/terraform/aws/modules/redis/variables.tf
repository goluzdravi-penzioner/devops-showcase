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

variable "cidr_private_subnets" {
  default = "10.0.16.0/20"
}
