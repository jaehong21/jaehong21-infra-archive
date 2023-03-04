module "key_pair" {
  source = "./module/key-pair"
  dev_key_path = "/Users/jaehong21/Desktop/server-key/dev_key.pub"
}

module "lightsail" {
  source = "./module/lightsail"
  key_pair = module.key_pair.dev_key_pair_lightsail
}
#  output "lightsail" {
#    value = module.lightsail.test_instance_static_ip
#  }