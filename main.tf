resource "aws_lb" "frontend" {
  name                       = "frontend-${var.ENV}"
  internal                   = false
  load_balancer_type         = "application"
  enable_deletion_protection = false
  subnets                    = data.terraform_remote_state.vpc.outputs.PUBLIC_SUBNETS_IDS
  security_groups            = [aws_security_group.allow-public.id]
  tags = {
    Name = "frontend-${var.ENV}"
    env  = var.ENV
  }
}

resource "aws_lb" "backend" {
  name                       = "backend-${var.ENV}"
  internal                   = true
  load_balancer_type         = "application"
  enable_deletion_protection = false
  subnets                    = data.terraform_remote_state.vpc.outputs.PRIVATE_SUBNETS_IDS
  security_groups            = [aws_security_group.allow-private.id]
  tags = {
    Name = "backend-${var.ENV}"
    env  = var.ENV
  }
}