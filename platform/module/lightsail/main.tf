# resource "aws_lightsail_instance" "jaehong21" {
#   availability_zone = "ap-northeast-2a"
#   blueprint_id      = "ubuntu_20_04"
#   bundle_id         = "micro_2_0"
#   name              = "jaehong21-instance"
#   key_pair_name = var.key_pair
# }
# resource "aws_lightsail_instance_public_ports" "jaehong21_public_ports" {
#   instance_name = aws_lightsail_instance.jaehong21.name
#   port_info {
#     protocol  = "tcp"
#     from_port = 22
#     to_port   = 22
#   }
#   port_info {
#     protocol  = "tcp"
#     from_port = 25
#     to_port   = 25
#   }
#   port_info {
#     protocol  = "tcp"
#     from_port = 80
#     to_port   = 80
#   }
#   port_info {
#     protocol  = "tcp"
#     from_port = 110
#     to_port   = 110
#   }
#   port_info {
#     protocol  = "tcp"
#     from_port = 143
#     to_port   = 143
#   }
#   port_info {
#     protocol  = "tcp"
#     from_port = 443
#     to_port   = 443
#   }
#   port_info {
#     protocol  = "tcp"
#     from_port = 465
#     to_port   = 465
#   }
#   port_info {
#     protocol  = "tcp"
#     from_port = 587
#     to_port   = 587
#   }
#   port_info {
#     protocol  = "tcp"
#     from_port = 993
#     to_port   = 993
#   }
#   port_info {
#     protocol  = "tcp"
#     from_port = 995
#     to_port   = 995
#   }
#   port_info {
#     protocol  = "tcp"
#     from_port = 4190
#     to_port   = 4190
#   }
#   port_info {
#     protocol  = "tcp"
#     from_port = 4433
#     to_port   = 4433
#   }
#   port_info {
#     protocol  = "tcp"
#     from_port = 8000
#     to_port   = 8000
#   }
#   port_info {
#     protocol  = "tcp"
#     from_port = 9443
#     to_port   = 9443
#   }
# }

# resource "aws_lightsail_static_ip" "jaehong21_static_ip" {
#   name = "jaehong21-static-ip"
# }
# resource "aws_lightsail_static_ip_attachment" "jaehong21_static_ip_attachment" {
#   static_ip_name = aws_lightsail_static_ip.jaehong21_static_ip.name
#   instance_name = aws_lightsail_instance.jaehong21.name
# }
