#############################################################
# CloudForge DevOps Platform
# Terraform Module - Application Load Balancer (ALB)
#############################################################

resource "aws_security_group" "alb" {
  name        = "${var.project_name}-alb-sg"
  description = "Security Group for CloudForge ALB"
  vpc_id      = var.vpc_id

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"

    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"

    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  egress {
    description = "Allow All"

    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  tags = merge(var.tags, {
    Name = "${var.project_name}-alb-sg"
  })
}

#############################################################
# Application Load Balancer
#############################################################

resource "aws_lb" "this" {

  name               = "${var.project_name}-alb"

  internal           = false
  load_balancer_type = "application"

  security_groups = [
    aws_security_group.alb.id
  ]

  subnets = var.public_subnet_ids

  enable_deletion_protection = false

  tags = merge(var.tags, {
    Name = "${var.project_name}-alb"
  })
}

#############################################################
# Target Group
#############################################################

resource "aws_lb_target_group" "frontend" {

  name = "${var.project_name}-tg"

  port     = var.target_port
  protocol = "HTTP"

  target_type = "ip"

  vpc_id = var.vpc_id

  health_check {

    enabled = true

    path = "/"

    protocol = "HTTP"

    matcher = "200"

    interval            = 30
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }

  tags = merge(var.tags, {
    Name = "${var.project_name}-tg"
  })
}

#############################################################
# HTTP Listener
#############################################################

resource "aws_lb_listener" "http" {

  load_balancer_arn = aws_lb.this.arn

  port = 80

  protocol = "HTTP"

  default_action {

    type = "forward"

    target_group_arn = aws_lb_target_group.frontend.arn
  }
}

#############################################################
# HTTPS Listener (Optional)
#############################################################

resource "aws_lb_listener" "https" {

  count = var.certificate_arn == "" ? 0 : 1

  load_balancer_arn = aws_lb.this.arn

  port = 443

  protocol = "HTTPS"

  ssl_policy = "ELBSecurityPolicy-2016-08"

  certificate_arn = var.certificate_arn

  default_action {

    type = "forward"

    target_group_arn = aws_lb_target_group.frontend.arn
  }
}