resource "aws_eks_cluster" "test_eks_cluster" {
  depends_on = [
    aws_iam_role_policy_attachment.test_iam_policy_eks_cluster,
    aws_iam_role_policy_attachment.test_iam_policy_eks_cluster_vpc,
  ]

  name = var.cluster_name
  role_arn = aws_iam_role.test_iam_role_eks_cluster.arn
  version = "1.21"

  vpc_config {
    security_group_ids = [aws_security_group.test_security_group_eks_cluster.id]
    subnet_ids = [var.default_subnet.a, var.default_subnet.b]
    endpoint_public_access = true
  }
}