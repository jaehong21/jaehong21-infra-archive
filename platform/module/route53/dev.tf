#  # Dev A Record
#  resource "aws_route53_record" "dev_backend_doggly_a" {
#    zone_id = aws_route53_zone.doggly_co_kr.id
#    records = ["54.180.151.206"]
#    name = "api.dev.doggly.co.kr"
#    type    = "A"
#    ttl     = "30"
#  }
#  resource "aws_route53_record" "dev_ai_doggly_a" {
#    zone_id = aws_route53_zone.doggly_co_kr.id
#    records = [var.static_ip_address.ai_dev]
#    name = "ai.dev.doggly.co.kr"
#    type    = "A"
#    ttl     = "30"
#  }
#  resource "aws_route53_record" "dev_recommend_doggly_a" {
#    zone_id = aws_route53_zone.doggly_co_kr.id
#    records = [var.static_ip_address.recommend_dev]
#    name = "recommend.api.dev.doggly.co.kr"
#    type    = "A"
#    ttl     = "30"
#  }
#
#  # Dev Cloudfront A Record
#  resource "aws_route53_record" "dev_shop_doggly_a" {
#    zone_id = aws_route53_zone.doggly_co_kr.id
#    name    = "dev.doggly.co.kr"
#    type    = "A"
#    alias {
#      zone_id = var.cloudfront_zone_id
#      name = "d2013bku4lxsx4.cloudfront.net"
#      evaluate_target_health = false
#    }
#  }
#  resource "aws_route53_record" "dev_seller_doggly_a" {
#    zone_id = aws_route53_zone.doggly_co_kr.id
#    name    = "partners.dev.doggly.co.kr"
#    type    = "A"
#    alias {
#      zone_id = var.cloudfront_zone_id
#      name = "d3puioh0ckv3pb.cloudfront.net"
#      evaluate_target_health = false
#    }
#  }
#  resource "aws_route53_record" "dev_admin_doggly_a" {
#    zone_id = aws_route53_zone.doggly_co_kr.id
#    name    = "admin.dev.doggly.co.kr"
#    type    = "A"
#    alias {
#      zone_id = var.cloudfront_zone_id
#      name = "d1p9y5ylatasqo.cloudfront.net"
#      evaluate_target_health = false
#    }
#  }