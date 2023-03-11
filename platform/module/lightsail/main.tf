resource "aws_lightsail_instance" "docker_project" {
  availability_zone = "ap-northeast-2a"
  blueprint_id      = "ubuntu_18_04"
  bundle_id         = "nano_2_0"
  name              = "docker-project"
  key_pair_name = var.key_pair
}
resource "aws_lightsail_instance_public_ports" "docker_project_public_ports" {
  instance_name = aws_lightsail_instance.docker_project.name
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
}

resource "aws_lightsail_static_ip" "docker_project_static_ip" {
  name = "docker-project-static-ip"
}
resource "aws_lightsail_static_ip_attachment" "docker_project_static_ip_attachment" {
  static_ip_name = aws_lightsail_static_ip.docker_project_static_ip.id
  instance_name = aws_lightsail_instance.docker_project.id
}
