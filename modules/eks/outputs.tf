output "cluster_name" {
  value = aws_eks_cluster.main.name
}

output "oidc_issuer" {
  value = aws_eks_cluster.main.identity[0].oidc[0].issuer
}

output "cluster_ca_cert" {
  value = aws_eks_cluster.main.certificate_authority[0].data
}

output "cluster_endpoint" {
  value = aws_eks_cluster.main.endpoint
}
