output "dev_key_pair_lightsail" {
  value = aws_lightsail_key_pair.dev_key_pair_lightsail.name
}

output "dev_key_pair" {
    value = aws_key_pair.dev_key_pair.key_name
}