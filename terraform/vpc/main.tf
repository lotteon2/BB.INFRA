provider "aws" {
  region = "ap-northeast-2"
}

locals {
  cluster_name = "blooming-blooms"
}


module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = local.cluster_name
  cidr = "10.0.0.0/16"

  azs             = ["ap-northeast-2a", "ap-northeast-2b"]
  public_subnets  = ["10.0.10.0/24", "10.0.20.0/24"]
  private_subnets = ["10.0.11.0/24", "10.0.21.0/24"]

  enable_nat_gateway     = true
  one_nat_gateway_per_az = true

  enable_dns_hostnames = true

  tags = {
    Terraform   = "true"
    Environment = "prod"
  }

}

# Create Security Group for EKS
resource "aws_security_group" "eks_security_group" {
  name        = "eks-security-group"
  description = "Security group for BB EKS"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "Allow inbound traffic for BB EKS"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
