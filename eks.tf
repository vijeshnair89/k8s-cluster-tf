module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = var.cluster_name
  cluster_version = "1.29"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  enable_irsa = true  # needed for service accounts

  eks_managed_node_groups = {
    default = {
      desired_size = var.desired_size
      max_size     = 2
      min_size     = 1
      instance_types = [var.instance_type]
      key_name = var.key_name
    }
  }

  tags = {
    Environment = "dev"
  }
}
