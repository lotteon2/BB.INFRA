module "eks" {
  source = "terraform-aws-modules/eks/aws"

  cluster_name    = "blooming-blooms-eks-cluster"
  cluster_version = "1.28"

  cluster_endpoint_private_access = false
  cluster_endpoint_public_access  = true

  enable_irsa             = true

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  cluster_addons = {
    coredns = {
      resolve_conflicts = "OVERWRITE"
    }
    kube-proxy = {}
    vpc-cni    = {
      resolve_conflicts = "OVERWRITE"
    }
  }

  eks_managed_node_group_defaults = {
    disk_size = 50
  }

  eks_managed_node_groups = {
    general = {
      desired_size = 1
      min_size     = 1
      max_size     = 10

      labels = {
        role = "general"
      }

      instance_types = ["t3.small"]
      capacity_type  = "ON_DEMAND"
    }

    spot = {
      desired_size = 1
      min_size     = 1
      max_size     = 10

      labels = {
        role = "spot"
      }

      taints = [
        {
          key    = "market"
          value  = "spot"
          effect = "NO_SCHEDULE"
        }
      ]

      instance_types = ["t3.micro"]
      capacity_type  = "SPOT"
    }
  }
}
data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}