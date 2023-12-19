resource "aws_vpc" "practice-vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  instance_tenancy     = "default"
  tags                 = {
    Name = "practice-vpc"
  }
}

resource "aws_subnet" "public-a" {
  vpc_id                  = aws_vpc.practice-vpc.id
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "ap-northeast-2a"
}

resource "aws_subnet" "public-c" {
  vpc_id                  = aws_vpc.practice-vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "ap-northeast-2c"
}

resource "aws_subnet" "private-a" {
  vpc_id                  = aws_vpc.practice-vpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "ap-northeast-2a"
}

resource "aws_subnet" "private-c" {
  vpc_id                  = aws_vpc.practice-vpc.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "ap-northeast-2c"
}


resource "aws_internet_gateway" "practice-igw" {
  vpc_id = aws_vpc.practice-vpc.id
  tags   = {
    Name = "practice-internet-gateway"
  }
}


resource "aws_default_route_table" "public-route_table" {
  default_route_table_id = aws_vpc.practice-vpc.default_route_table_id
  tags                   = {
    Name = "default"
  }
}

resource "aws_route" "internet-gw-route" {
  route_table_id         = aws_vpc.practice-vpc.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.practice-igw.id
}

resource "aws_eip" "practice-nat-eip" {
  vpc        = true
  depends_on = [aws_internet_gateway.practice-igw]
}

resource "aws_nat_gateway" "prac-nat" {
  allocation_id = aws_eip.practice-nat-eip.id
  subnet_id     = aws_subnet.public-a.id
  depends_on    = [aws_internet_gateway.practice-igw]
}

resource "aws_route_table" "practice-private-route-table" {
  vpc_id = aws_vpc.practice-vpc.id
  tags   = {
    Name = "private"
  }
}


resource "aws_route" "private_route" {
  route_table_id         = aws_route_table.practice-private-route-table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.prac-nat.id
}

resource "aws_route_table_association" "public_subneta_association" {
  subnet_id      = aws_subnet.public-a.id
  route_table_id = aws_vpc.practice-vpc.main_route_table_id
}

resource "aws_route_table_association" "public_subnetb_association" {
  subnet_id      = aws_subnet.public-c.id
  route_table_id = aws_vpc.practice-vpc.main_route_table_id
}

resource "aws_route_table_association" "private_subneta_association" {
  subnet_id      = aws_subnet.private-a.id
  route_table_id = aws_route_table.practice-private-route-table.id
}

resource "aws_route_table_association" "private_subnetb_association" {
  subnet_id      = aws_subnet.private-c.id
  route_table_id = aws_route_table.practice-private-route-table.id
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "18.26.6"
  cluster_name    = "practice-cluster"
  cluster_version = "1.22"
  vpc_id          = aws_vpc.practice-vpc.id
  subnet_ids = [
    aws_subnet.public-a.id,
    aws_subnet.public-c.id,
    aws_subnet.private-a.id,
    aws_subnet.private-c.id
  ]
  eks_managed_node_groups = {
    default_node_group = {
      min_size       = 2
      max_size       = 5
      desired_size   = 2
      instance_types = ["t3.small"]
    }
  }
  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
  cluster_endpoint_private_access = true
}

resource "aws_security_group_rule" "eks_cluster_add_access" {
  security_group_id = module.eks.cluster_security_group_id
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["10.0.0.0/16"]
}

resource "aws_security_group_rule" "eks_node_add_access" {
  security_group_id = module.eks.node_security_group_id
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["10.0.0.0/16"]
}