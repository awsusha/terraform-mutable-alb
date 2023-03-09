resource "aws_route53_record" "frontend" {
  zone_id = data.terraform_remote_state.vpc.outputs.PUBLIC_HOSTED_ZONEID
  name    = "roboshop-${var.ENV}"
  type    = "CNAME"
  ttl     = "300"
  records = [aws_lb.frontend.dns_name]
}