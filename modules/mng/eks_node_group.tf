resource "aws_eks_node_group" "mng" {
  cluster_name    = var.eks_cluster_name
  node_group_name = "node-group"
  node_role_arn   = aws_iam_role.mng.arn
  subnet_ids      = var.subnet_ids

  scaling_config {
    max_size     = 1
    min_size     = 1
    desired_size = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.cni,
    aws_iam_role_policy_attachment.ecr,
    aws_iam_role_policy_attachment.worker
  ]
}
