provider "aws" {
  region = "ap-northeast-2"
}

resource "aws_iam_role" "eks_cluster" {
  name = "bb-eks-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "eks.amazonaws.com",
        },
      },
    ],
  })
}

#resource "aws_eks_cluster" "eks_cluster" {
#  name     = "blooming-blooms"
#  role_arn = aws_iam_role.eks_cluster.arn
#}
#
