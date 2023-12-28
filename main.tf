module "network" {
  source = "./modules/network"

  region         = var.region
  vpc_cidr_block = var.vpc_cidr_block
}

module "eks" {
  source = "./modules/eks"

  public_subnet_ids = [module.network.public_subnet_1a_id, module.network.public_subnet_1b_id]
}

module "eks-mng" {
  source = "./modules/mng"

  subnet_ids       = [module.network.private_subnet_1a_id, module.network.private_subnet_1b_id]
  eks_cluster_name = module.eks.cluster_name
}

module "eks-lb-controller" {
  source = "./modules/lb-controller"

  region       = var.region
  oidc_issuer  = module.eks.oidc_issuer
  cluster_name = module.eks.cluster_name
}
