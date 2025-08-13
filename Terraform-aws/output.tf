output "bastion_public_ip" {
  value = aws_instance.bastion.public_ip
}

output "eks_cluster_name" {
  value = aws_eks_cluster.private_eks.name
}

output "kubeconfig" {
  value = <<EOT
aws eks --region us-east-1 update-kubeconfig --name ${aws_eks_cluster.private_eks.name}
EOT
}

