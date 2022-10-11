variable "ami_ubuntu_22_04" {
  type = string
  default = "ami-0e9bfdb247cc8de84"
}

variable "key_name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "subnet_a_id" {
  type = string
}