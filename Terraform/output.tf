output "mvpc" {
    value= aws_vpc.mvpc.id 
}

output "publicsubnet" {
    value=aws_subnet.publicsubnet.id 
}

output "privatesubnet" {
    value=aws_subnet.privatesubnet.id 
}