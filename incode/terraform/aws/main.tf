module "vpc" {
  source       = "./modules/vpc"
  cluster_name = var.cluster_name
}

module "eks" {
  source                   = "./modules/eks"
  k8s_version              = var.k8s_version
  vpc_id                   = module.vpc.vpc_id
  public_subnets           = module.vpc.public_subnets
  private_subnets          = module.vpc.private_subnets
  existing_private_subnets = ["list", "of", "existing", "private", "subnet", "ids"]
  existing_public_subnets  = ["list", "of", "existing", "public", "subnet", "ids"]
  existing_vpc             = false
  cluster_name             = var.cluster_name
  region                   = var.region
}

module "rds" {
  source = "./modules/rds"
  rds_db_username =   var.rds_db_username
  rds_storage = var.rds_storage
  rds_db_name = var.rds_db_name
  rds_engine_version = var.rds_engine_version
  rds_instance_class = var.rds_instance_class
  cidr_private_subnets = var.cidr_private_subnets
}

module "redis" {
  source = "./modules/redis"
  redis_cluster_name = var.redis_cluster_name
  redis_node_type = var.redis_node_type
  redis_nodes = var.redis_nodes
  redis_engine_version = var.rds_engine_version
  cidr_private_subnets = var.cidr_private_subnets
}

