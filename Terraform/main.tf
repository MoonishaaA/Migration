resource "aws_vpc" "mvpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "publicsubnet" {
    vpc_id = aws_vpc.mvpc.id
}

resource "aws_subnet" "privatesubnet" {
    vpc_id = aws_vpc.mvpc.id
  
}