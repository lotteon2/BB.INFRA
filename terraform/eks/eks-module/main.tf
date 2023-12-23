# main.tf

provider "aws" {
  region = "ap-northeast-2"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name   = "eks-vpc"
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "my-eks-cluster"
  cluster_version = "1.21"
  subnets         = module.vpc.private_subnets
  vpc_id          = module.vpc.vpc_id
}

# IAM Role for EKS Nodes
module "eks_nodes_iam" {
  source       = "terraform-aws-modules/eks/aws//modules/workers"
  cluster_name = module.eks.cluster_id
}

resource "null_resource" "apply_k8s_configs" {
  provisioner "local-exec" {
    command = <<-EOT
      kubectl apply -f ../kubernetes/deployment.yaml
      kubectl apply -f ../kubernetes/service.yaml
      kubectl apply -f ../kubernetes/initdb-config.yaml
    EOT
  }

  depends_on = [
    module.eks,
  ]
}
