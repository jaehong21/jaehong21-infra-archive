output "k3s_master_node_public_ip" {
  value = aws_eip.k3s_master_node_static_ip.public_ip
}