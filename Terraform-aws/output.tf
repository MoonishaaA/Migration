output "mvpc" {
    value= aws_vpc.mvpc.id 
}

output "publicsubnet" {
    value=aws_subnet.publicsubnet.id 
}

output "privatesubnet" {
    value=aws_subnet.privatesubnet.id 
}

output "cluster" {
    value = aws_eks_cluster.private_eks.name
}

output "db_instance" {
    value = aws_db_instance.rds_instance.id
}