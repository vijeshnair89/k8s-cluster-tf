output "cluster_name" {
  value = module.eks.cluster_name
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "cluster_id" {
  value = module.eks.cluster_id
}

output "node_group" {
    value = module.eks.eks_managed_node_groups
}

output "kubeconfig_update_command" {
  description = "Command to update kubeconfig for EKS cluster"
  value = "aws eks --region ${var.aws_region} update-kubeconfig --name ${var.cluster_name}"
}
