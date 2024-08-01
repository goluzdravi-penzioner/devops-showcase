variable "subnet_numbers" {
  description = "Map from availability zone to the number that should be used for each availability zone's subnet"
  default     = {
    "eu-west-1a" = 1
    "eu-west-1b" = 2
    #"eu-west-1c" = 3
  }
}

variable "cidr_block" {
    default = "10.0.0.0/16"
}

variable "cidr_public_subnets" {
    default = "10.0.0.0/20"
}

variable "cidr_private_subnets" {
  default = "10.0.16.0/20"
}

variable "cluster_name" {}