provider "aws" {
  region = "ap-northeast-2"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name                 = "blooming-blooms"
  cidr                 = "10.0.0.0/16"
  azs                  = ["ap-northeast-2a", "ap-northeast-2b"]
  private_subnets      = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets       = ["10.0.3.0/24", "10.0.4.0/24"]
  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_support   = true
  enable_dns_hostnames = true
}

#resource "aws_route_table_association" "bastion_association" {
#  subnet_id      = module.vpc.public_subnets[0]
#  route_table_id = module.vpc.public_subnet_route_table_ids[0]
#}
#
#resource "aws_route_table_association" "nat_association_eks_a" {
#  subnet_id      = module.vpc.private_subnets[0]
#  route_table_id = module.vpc.private_subnet_route_table_ids[0]
#}
#
#resource "aws_route_table_association" "nat_association_eks_b" {
#  subnet_id      = module.vpc.private_subnets[1]
#  route_table_id = module.vpc.private_subnet_route_table_ids[1]
#}
