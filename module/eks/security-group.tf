resource "aws_security_group" "test_security_group_eks_cluster" {
  name        = "test_security_group_eks_cluster"
  description = "test_security_group_eks_cluster"
  vpc_id      = var.default_vpc.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}