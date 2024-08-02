variable "region" {
  default = "eu-west-1"
}

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

variable "cidr_private_subnets" {
  default = "10.0.16.0/20"
}
