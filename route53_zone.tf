resource "aws_route53_zone" "web" {
  name = "dwayne-sutherland.com"
}

resource "aws_route53_record" "web" {
  zone_id = aws_route53_zone.web.zone_id
  name = "dwayne-sutherland.com"
  type    = "A"

  alias {
    name                   = aws_lb.web.dns_name
    zone_id                = aws_lb.web.zone_id
    evaluate_target_health = true
  }
}