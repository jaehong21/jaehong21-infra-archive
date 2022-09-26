resource "aws_security_group" "default_security_group" {
  name       = "default_security_group"
  description = "Allow inbound traffic from HTTP/HTTPs"
  vpc_id      = aws_vpc.default_vpc.id

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allow HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_instance" "test_public_1_a" {
  ami           = var.ami.ubuntu_22_04
  instance_type = "t2.micro"
  key_name      = aws_key_pair.vpn_key.key_name
  # security_groups = [aws_security_group.ec2_security_group.id]
  vpc_security_group_ids = [aws_security_group.default_security_group.id]
  subnet_id     = aws_subnet.first_public_subnet.id
  associate_public_ip_address = true
  tags = {
    Name = "test_public_1_a"
  }
}
resource "aws_instance" "test_private_1_a" {
  ami           = var.ami.ubuntu_22_04
  instance_type = "t2.micro"
  key_name      = aws_key_pair.vpn_key.key_name
  # security_groups = [aws_security_group.ec2_security_group.id]
  vpc_security_group_ids = [aws_security_group.default_security_group.id]
  subnet_id     = aws_subnet.first_private_subnet.id
  associate_public_ip_address = false
  tags = {
    Name = "test_private_1_a"
  }
}

output "test_public_1_a" {
  value = aws_instance.test_public_1_a.public_ip
}
output "test_private_1_a" {
  value = aws_instance.test_private_1_a.private_ip
}
