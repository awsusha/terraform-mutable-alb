output "frontend-arn" {
  value = aws_lb.frontend.arn
}

output "backend" {
  value = aws_lb.backend.arn
}

output "backend_listener_arn" {
  value = aws_lb_listener.backend.arn
}

output "backend_lb_address" {
  value = aws_lb.backend.dns_name
}