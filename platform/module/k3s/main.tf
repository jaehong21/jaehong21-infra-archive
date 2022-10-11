# k3s Master node
resource "aws_instance" "k3s_master_node" {
  ami = var.ami_ubuntu_22_04
  instance_type = "t3.medium"
  key_name = var.key_name
  network_interface {
    device_index         = 0
    network_interface_id = aws_network_interface.k3s_master_node_network_interface.id
  }
  tags = {
      Name = "k3s_master_node"
  }
}
resource "aws_network_interface" "k3s_master_node_network_interface" {
  subnet_id = var.subnet_a_id
  security_groups = [aws_security_group.k3s_security_group.id]
  tags = {
    Name = "k3s_master_node_network_interface"
  }
}
resource "aws_eip" "k3s_master_node_static_ip" {
  vpc               = true
  instance          = aws_instance.k3s_master_node.id
  network_interface = aws_network_interface.k3s_master_node_network_interface.id
  tags              = {
    Name = "k3s_master_node_static_ip"
  }
}