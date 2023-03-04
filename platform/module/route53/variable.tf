variable "static_ip_address" {
  type = map(string)
  default = {}
}

variable "cloudfront_zone_id" {
  type = string
  // cloudfront zone_id = Z2FDTNDATAQYW2
  default = "Z2FDTNDATAQYW2"
}