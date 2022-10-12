resource "aws_lightsail_instance" "test_instance" {
  availability_zone = "ap-northeast-2a"
  blueprint_id      = "ubuntu_18_04"
  bundle_id         = "nano_2_0"
  name              = "test_instance"
  key_pair_name = var.key_pair
}
resource "aws_lightsail_instance_public_ports" "test_instance_public_ports" {
  instance_name = aws_lightsail_instance.test_instance.name
  port_info {
    protocol  = "tcp"
    from_port = 22
    to_port   = 22
  }
  port_info {
    protocol  = "tcp"
    from_port = 80
    to_port   = 80
  }
  port_info {
    protocol  = "tcp"
    from_port = 443
    to_port   = 443
  }
  port_info {
    protocol  = "tcp"
    from_port = 8080
    to_port   = 8080
  }
}

resource "aws_lightsail_static_ip" "test_instance_static_ip" {
  name = "test_instance_static_ip"
}
resource "aws_lightsail_static_ip_attachment" "test_instance_static_ip_attachment" {
  static_ip_name = aws_lightsail_static_ip.test_instance_static_ip.id
  instance_name = aws_lightsail_instance.test_instance.id
}
