output "cluster_name" {
  description = "EKS cluster name"
  value       = aws_eks_cluster.main.name
}

output "cluster_endpoint" {
  description = "EKS cluster API endpoint"
  value       = aws_eks_cluster.main.endpoint
}

output "cluster_security_group_id" {
  description = "Security group ID used by the EKS cluster"
  value       = aws_security_group.eks_cluster.id
}

output "node_group_names" {
  description = "List of EKS node group names"
  value       = [for ng in aws_eks_node_group.main : ng.node_group_name]
}

output "node_group_arns" {
  description = "ARNs of EKS node groups"
  value       = [for ng in aws_eks_node_group.main : ng.arn]
}

