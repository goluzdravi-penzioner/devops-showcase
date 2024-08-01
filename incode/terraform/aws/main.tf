module "vpc" {
    source = "./modules/vpc"
    cluster_name = var.cluster_name
}

module "eks" {
    source = "./modules/eks"
    k8s_version = var.k8s_version
    vpc_id = module.vpc.vpc_id
    public_subnets = module.vpc.public_subnets
    private_subnets = module.vpc.private_subnets
    existing_private_subnets = ["list", "of", "existing", "private", "subnet", "ids"]
    existing_public_subnets = ["list", "of", "existing", "public", "subnet", "ids"]
    existing_vpc = false    
    cluster_name = var.cluster_name
    region = var.region    
}