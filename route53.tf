/*data "aws_route53_zone" "s3_hostedzone" {
  name         = var.s3_hostedzone
  private_zone = false
}

resource "aws_route53_record" "root" {
  zone_id = data.aws_route53_zone.s3_hostedzone.id
  name    = var.s3_hostedzone
  type    = "A"

  alias {
    name                   = aws_s3_bucket.root_domain_bucket.website_domain
    zone_id                = aws_s3_bucket.root_domain_bucket.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "subdomain" {
  zone_id = data.aws_route53_zone.s3_hostedzone.id
  name    = "www.${var.s3_hostedzone}"
  type    = "A"

  alias {
    name                   = aws_s3_bucket.sub_domain_bucket.website_domain
    zone_id                = aws_s3_bucket.sub_domain_bucket.hosted_zone_id
    evaluate_target_health = false
  }
}*/