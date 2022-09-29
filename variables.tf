variable "ami" {
  default = {
    nat_instance = "ami-0abd4c49376ea5dbb"
    ubuntu_22_04 = "ami-058165de3b7202099"
  }
}

variable "key_path" {
  default = {
    dev_key = "~/Desktop/server-key/dev_key.pub"
    vpn_key = "~/Desktop/server-key/vpn_key.pub"
  }
}