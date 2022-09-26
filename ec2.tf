resource "aws_security_group" "nat_instance_security_group" {
  name       = "nat_instance_security_group"
  description = "Allow inbound traffic only from SSH"
  vpc_id      = aws_vpc.default_vpc.id

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
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
resource "aws_instance" "nat_instance" {
  ami           = "ami-058165de3b7202099"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.vpn_key.key_name
  # security_groups = [aws_security_group.ec2_security_group.id]
  vpc_security_group_ids = [aws_security_group.nat_instance_security_group.id]
  subnet_id     = aws_subnet.first_public_subnet.id
  associate_public_ip_address = true
  # 소스/대상 확인
  source_dest_check = false

  tags = {
    Name = "nat_instance"
  }
}

resource "aws_eip" "nat_instance_static_ip" {
  instance = aws_instance.nat_instance.id
  network_interface = var.aws_instance.nat_instance.id
  vpc = true
}
output "nat_instance_static_ip" {
  value = aws_eip.nat_instance_static_ip.public_ip
}

resource "aws_key_pair" "vpn_key" {
  key_name   = "vpn-key"
  public_key = file("~/Desktop/server-key/vpn_key.pub")
}