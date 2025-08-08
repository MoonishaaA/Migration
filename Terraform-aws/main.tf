resource "aws_vpc" "mvpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "MyVPC"
  }
}

resource "aws_subnet" "publicsubnet" {
    vpc_id = aws_vpc.mvpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-1b"
    tags = {
        Name = "MyPublicSubnet"
    }
}

resource "aws_subnet" "privatesubnet" {
    vpc_id = aws_vpc.mvpc.id
    cidr_block = "10.0.2.0/24"
    availability_zone  = "us-east-1a"
    tags = {
        Name = "MyPrivateSubnet"
    }
}

resource "aws_eks_cluster" "private_eks" {
  name     = "my-eks-cluster"
  role_arn = aws_iam_role.eks_cluster_role.arn
  version = "1.29"
  vpc_config {
    subnet_ids = [
      aws_subnet.publicsubnet.id,
      aws_subnet.privatesubnet.id
    ]
    endpoint_private_access = true
    endpoint_public_access = false
  }
}

resource "aws_db_instance" "rds_instance" {
  allocated_storage = 20
  engine = "mysql"
  engine_version = "8.0"
  instance_class = "db.t3.micro"
  db_name = "mydb"
  password = "12387654"
  username = "admin"
  storage_type = "gp2"
}
resource "aws_iam_role" "eks_cluster_role" {
  name = "eksClusterRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })

}

resource "aws_iam_role_policy_attachment" "eks_cluster_AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks_cluster_role.name
}

resource "aws_iam_role_policy_attachment" "eks_cluster_AmazonEKSServicePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  role       = aws_iam_role.eks_cluster_role.name
}
