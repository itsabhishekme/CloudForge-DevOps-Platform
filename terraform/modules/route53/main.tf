############################################################
# CloudForge DevOps Platform
# Terraform Module - Route 53
############################################################

# ----------------------------------------------------------
# Hosted Zone
# ----------------------------------------------------------

resource "aws_route53_zone" "this" {
  name = var.domain_name

  tags = merge(
    {
      Name        = "${var.project_name}-${var.environment}-hosted-zone"
      Project     = var.project_name
      Environment = var.environment
      ManagedBy   = "Terraform"
    },
    var.tags
  )
}

# ----------------------------------------------------------
# Root Domain Record
# ----------------------------------------------------------

resource "aws_route53_record" "root" {
  zone_id = aws_route53_zone.this.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = var.load_balancer_dns_name
    zone_id                = var.load_balancer_zone_id
    evaluate_target_health = true
  }
}

# ----------------------------------------------------------
# WWW Record
# ----------------------------------------------------------

resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.this.zone_id
  name    = "www.${var.domain_name}"
  type    = "A"

  alias {
    name                   = var.load_balancer_dns_name
    zone_id                = var.load_balancer_zone_id
    evaluate_target_health = true
  }
}

# ----------------------------------------------------------
# API Subdomain
# ----------------------------------------------------------

resource "aws_route53_record" "api" {
  zone_id = aws_route53_zone.this.zone_id
  name    = "api.${var.domain_name}"
  type    = "A"

  alias {
    name                   = var.load_balancer_dns_name
    zone_id                = var.load_balancer_zone_id
    evaluate_target_health = true
  }
}

# ----------------------------------------------------------
# Monitoring Subdomain
# ----------------------------------------------------------

resource "aws_route53_record" "grafana" {
  zone_id = aws_route53_zone.this.zone_id
  name    = "grafana.${var.domain_name}"
  type    = "A"

  alias {
    name                   = var.load_balancer_dns_name
    zone_id                = var.load_balancer_zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "prometheus" {
  zone_id = aws_route53_zone.this.zone_id
  name    = "prometheus.${var.domain_name}"
  type    = "A"

  alias {
    name                   = var.load_balancer_dns_name
    zone_id                = var.load_balancer_zone_id
    evaluate_target_health = true
  }
}

# ----------------------------------------------------------
# Logging Subdomains
# ----------------------------------------------------------

resource "aws_route53_record" "kibana" {
  zone_id = aws_route53_zone.this.zone_id
  name    = "kibana.${var.domain_name}"
  type    = "A"

  alias {
    name                   = var.load_balancer_dns_name
    zone_id                = var.load_balancer_zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "jenkins" {
  zone_id = aws_route53_zone.this.zone_id
  name    = "jenkins.${var.domain_name}"
  type    = "A"

  alias {
    name                   = var.load_balancer_dns_name
    zone_id                = var.load_balancer_zone_id
    evaluate_target_health = true
  }
}