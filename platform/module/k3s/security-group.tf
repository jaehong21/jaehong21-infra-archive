resource "aws_security_group" "k3s_security_group" {
  name   = "k3s_security_group"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 6443
    to_port   = 6443
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 51820
    to_port   = 51820
    protocol  = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 51821
    to_port   = 51821
    protocol  = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 10250
    to_port   = 10250
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 2379
    to_port   = 2379
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 2380
    to_port   = 2380
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # argocd
  ingress {
    from_port = 30310
    to_port   = 30310
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 30233
    to_port   = 30233
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}