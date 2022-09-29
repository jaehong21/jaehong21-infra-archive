# IAM role for EKS Cluster
resource "aws_iam_role" "test_iam_role_eks_cluster" {
  name = "test_iam_role_eks_cluster"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "test_iam_policy_eks_cluster" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.test_iam_role_eks_cluster.name
}
resource "aws_iam_role_policy_attachment" "test_iam_policy_eks_cluster_vpc" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = aws_iam_role.test_iam_role_eks_cluster.name
}

# IAM role for EKS Node Group
resource "aws_iam_role" "test_iam_role_eks_node_group" {
  name = "test_iam_role_eks_node_group"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      },
    ]
  })
}
resource "aws_iam_role_policy_attachment" "test_iam_policy_eks_node_group" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.test_iam_role_eks_node_group.name
}
resource "aws_iam_role_policy_attachment" "test_iam_policy_eks_node_group_cni" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.test_iam_role_eks_node_group.name
}
resource "aws_iam_role_policy_attachment" "test_iam_policy_eks_node_group_ecr" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.test_iam_role_eks_node_group.name
}