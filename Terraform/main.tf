resource "aws_vpc" "mvpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "MyVPC"
  }
}

resource "aws_subnet" "publicsubnet" {
    vpc_id = aws_vpc.mvpc.id
    cidr_block = "10.0.1.0/24"
    tags = {
        Name = "MyPublicSubnet"
    }
}

resource "aws_subnet" "privatesubnet" {
    vpc_id = aws_vpc.mvpc.id
    cidr_block = "10.0.2.0/24"
    tags = {
        Name = "MyPrivateSubnet"
    }
}

resource "aws_eks_cluster" "private_eks" {
  name     = "my-eks-cluster"
  role_arn = aws_iam_role.eks_cluster_role.arn
  version = "1.21"

  vpc_config {
    subnet_ids = [
      aws_subnet.publicsubnet.id,
      aws_subnet.privatesubnet.id
    ]
    endpoint_private_access = true
    endpoint_public_access = false
  }
}