resource "aws_eks_node_group" "test_eks_node_group" {
  cluster_name  = aws_eks_cluster.test_eks_cluster.name
  node_group_name = "test_eks_node_group"
  node_role_arn = aws_iam_role.test_iam_role_eks_node_group.arn
  subnet_ids    = [var.default_subnet.a, var.default_subnet.b]

  instance_types = ["t3a.medium"]
  disk_size = 20

  scaling_config {
    desired_size = 2
    max_size     = 1
    min_size     = 3
  }

  depends_on = [
    aws_iam_role_policy_attachment.test_iam_policy_eks_node_group,
    aws_iam_role_policy_attachment.test_iam_policy_eks_node_group_cni,
    aws_iam_role_policy_attachment.test_iam_policy_eks_node_group_ecr
  ]
}