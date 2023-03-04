# AWS Route53 Zone
resource "aws_route53_zone" "jaehong21" {
  name = "jaehong21.com"
}

#resource "aws_route53_record" "dev_k3s_route53_record" {
#  zone_id = aws_route53_zone.doggly_co_kr.id
#  records = [var.static_ip_address.k3s]
#  name = "dev.k3s.doggly.co.kr"
#  type    = "A"
#  ttl     = "30"
#}
#resource "aws_route53_record" "prod_k3s_route53_record" {
#  zone_id = aws_route53_zone.doggly_co_kr.id
#  records = [var.static_ip_address.k3s]
#  name = "prod.k3s.doggly.co.kr"
#  type    = "A"
#  ttl     = "30"
#}