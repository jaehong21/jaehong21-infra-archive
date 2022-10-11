# Prod A Record
resource "aws_route53_record" "prod_backend_doggly_a" {
  zone_id = aws_route53_zone.doggly_co_kr.zone_id
  records = [var.static_ip_address.backend_prod]
  name = "api.doggly.co.kr"
  type    = "A"
  ttl     = "30"
}
resource "aws_route53_record" "prod_ai_doggly_a" {
  zone_id = aws_route53_zone.doggly_co_kr.id
  records = [var.static_ip_address.ai_prod]
  name = "ai.doggly.co.kr"
  type    = "A"
  ttl     = "30"
}

# Prod Cloudfront A Record
resource "aws_route53_record" "prod_shop_doggly_a" {
  zone_id = aws_route53_zone.doggly_co_kr.zone_id
  name    = "doggly.co.kr"
  type    = "A"
  alias {
    zone_id = var.cloudfront_zone_id
    name = "d32g8euovsmv9z.cloudfront.net"
    evaluate_target_health = false
  }
}
resource "aws_route53_record" "prod_seller_doggly_a" {
  zone_id = aws_route53_zone.doggly_co_kr.zone_id
  name    = "partners.doggly.co.kr"
  type    = "A"
  alias {
    zone_id = var.cloudfront_zone_id
    name = "d2gvxaxuqrpxpp.cloudfront.net"
    evaluate_target_health = false
  }
}
resource "aws_route53_record" "prod_admin_doggly_a" {
  zone_id = aws_route53_zone.doggly_co_kr.zone_id
  name    = "admin.doggly.co.kr"
  type    = "A"
  alias {
    zone_id = var.cloudfront_zone_id
    name = "d34zlv6zy5l2yp.cloudfront.net"
    evaluate_target_health = false
  }
}