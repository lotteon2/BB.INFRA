provider "aws" {
  region = "us-west-2"  # Change this to your desired region
}

# Create VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "MyVPC"
  }
}

# Create Subnet
resource "aws_subnet" "my_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "us-west-2a"  # Change this to your desired availability zone
  map_public_ip_on_launch = true
  tags = {
    Name = "MySubnet"
  }
}

# Output VPC and Subnet IDs
output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

output "subnet_id" {
  value = aws_subnet.my_subnet.id
}


module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "my-eks-cluster"
  cluster_version = "1.21"
  subnets         = ["subnet-xxxxxxxxxxxxxxxxx", "subnet-yyyyyyyyyyyyyyyyy"]  # Add your subnet IDs
  vpc_id          = "vpc-xxxxxxxxxxxxxxxxx"  # Add your VPC ID
  key_name        = "your-key-pair"  # Add your key pair name

  node_groups = {
    eks_nodes = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1

      instance_type = "t2.small"  # Choose an instance type that suits your needs
    }
  }
}

provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_ca_certificate)
  token                  = module.eks.cluster_token
  load_config_file       = false
}

resource "kubernetes_namespace" "frontend" {
  metadata {
    name = "frontend"
  }
}

resource "kubernetes_namespace" "backend" {
  metadata {
    name = "backend"
  }
}

resource "kubernetes_deployment" "nginx" {
  metadata {
    name      = "nginx"
    namespace = kubernetes_namespace.frontend.metadata[0].name
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "nginx"
      }
    }

    template {
      metadata {
        labels = {
          app = "nginx"
        }
      }

      spec {
        container {
          name  = "nginx"
          image = "nginx:latest"
          ports {
            container_port = 80
          }
        }
      }
    }
  }
}

resource "kubernetes_deployment" "spring_cloud" {
  metadata {
    name      = "spring-cloud"
    namespace = kubernetes_namespace.backend.metadata[0].name
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "spring-cloud"
      }
    }

    template {
      metadata {
        labels = {
          app = "spring-cloud"
        }
      }

      spec {
        container {
          name  = "spring-cloud"
          image = "your-registry/your-spring-cloud-image:latest"  # Replace with your actual image
          ports {
            container_port = 8080
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "nginx_service" {
  metadata {
    name      = "nginx-service"
    namespace = kubernetes_namespace.frontend.metadata[0].name
  }

  spec {
    selector = {
      app = kubernetes_deployment.nginx.spec[0].template[0].metadata[0].labels[0].app
    }

    port {
      protocol    = "TCP"
      port        = 80
      target_port = 80
    }

    type = "LoadBalancer"
  }
}
