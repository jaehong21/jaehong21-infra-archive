resource "aws_security_group" "nat_instance_security_group" {
  name       = "nat_instance_security_group"
  description = "Allow all traffic"
  vpc_id      = aws_vpc.default_vpc.id

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allow HTTP in private subnet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [aws_subnet.first_private_subnet.cidr_block]
  }
  ingress {
    description = "Allow HTTPS in private subnet"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [aws_subnet.first_private_subnet.cidr_block]
  }
  ingress {
    description = "Allow MySQL in private subnet"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [aws_subnet.first_private_subnet.cidr_block]
  }
  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
# ingress {
#   description = "Allow all ICMP protocol"
#   from_port = -1
#   to_port   = -1
#   protocol = "icmp"
#   cidr_blocks = [aws_subnet.first_private_subnet.cidr_block]
#  }
#  egress {
#   from_port = -1
#   to_port   = -1
#   protocol = "icmp"
#   cidr_blocks = ["0.0.0.0/0"]
#  }
}
resource "aws_instance" "nat_instance" {
  ami           = var.ami.nat_instance
  instance_type = "t2.micro"
  key_name      = aws_key_pair.vpn_key.key_name
  # vpc_security_group_ids = [aws_security_group.nat_instance_security_group.id]
  # subnet_id     = aws_subnet.first_public_subnet.id
  network_interface {
    device_index = 0
    network_interface_id = aws_network_interface.nat_instance_network_interface.id
  }
  # associate_public_ip_address = true
  # source_dest_check = false
  tags = {
    Name = "nat_instance"
  }
}
resource "aws_network_interface" "nat_instance_network_interface" {
  subnet_id = aws_subnet.first_public_subnet.id
  security_groups = [aws_security_group.nat_instance_security_group.id]
  source_dest_check = false
  tags = {
    Name = "nat_instance_network_interface"
  }
}
resource "aws_eip" "nat_instance_static_ip" {
  instance = aws_instance.nat_instance.id
  network_interface = aws_network_interface.nat_instance_network_interface.id
  vpc = true
}
output "nat_instance_static_ip" {
  value = aws_eip.nat_instance_static_ip.public_ip
}

resource "aws_key_pair" "vpn_key" {
  key_name   = "vpn-key"
  public_key = file("~/Desktop/server-key/vpn_key.pub")
}

resource "aws_instance" "bastion_host" {
  ami           = var.ami.ubuntu_22_04
  instance_type = "t2.micro"
  key_name      = aws_key_pair.vpn_key.key_name
  # security_groups = [aws_security_group.ec2_security_group.id]
  vpc_security_group_ids = [aws_security_group.default_security_group.id]
  subnet_id     = aws_subnet.first_public_subnet.id
  associate_public_ip_address = true

  tags = {
    Name = "bastion_host"
  }
}