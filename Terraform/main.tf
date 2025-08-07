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