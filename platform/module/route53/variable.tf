variable "static_ip_address" {
  type = map(string)
  default = {
    recommend_dev = ""
    ai_dev = ""
    ai_prod = ""
    backend_prod = ""
  }
}

variable "cloudfront_zone_id" {
  type = string
  // cloudfront zone_id = Z2FDTNDATAQYW2
  default = "Z2FDTNDATAQYW2"
}