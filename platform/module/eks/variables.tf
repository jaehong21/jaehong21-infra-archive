variable "cluster_name" {
  type = string
}

variable "default_vpc" {
  type = map(string)
  default = {
    id = ""
  }
}
variable "default_subnet" {
  type = map(string)
  default = {
    a = ""
    b = ""
    c = ""
    d = ""
  }
}