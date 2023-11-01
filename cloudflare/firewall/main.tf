#
## Email
#
resource "cloudflare_email_routing_catch_all" "forward" {
  zone_id = var.zone_id
  name    = "email catch all"
  enabled = true

  matcher {
    type = "all"
  }

  action {
    type  = "forward"
    value = ["bwp.pearson@gmail.com"]
  }
}

#
## Block non US CA AU countries
#

resource "cloudflare_filter" "countries" {
  zone_id     = var.zone_id
  description = "Expression to block all countries except US, CA and AU"
  expression  = "(ip.geoip.country ne \"US\" and ip.geoip.country ne \"CA\" and ip.geoip.country ne \"AU\")"
}

resource "cloudflare_firewall_rule" "countries" {
  zone_id     = var.zone_id
  description = "Firewall rule to block all countries except US, CA and AU"
  filter_id   = cloudflare_filter.countries.id
  action      = "block"
}

#
## Bots
#

resource "cloudflare_filter" "bots" {
  zone_id     = var.zone_id
  description = "Expression to block bots determined by CF"
  expression  = "(cf.client.bot)"
}

resource "cloudflare_firewall_rule" "bots" {
  zone_id     = var.zone_id
  description = "Firewall rule to block bots determined by CF"
  filter_id   = cloudflare_filter.bots.id
  action      = "block"
}

#
## Block threats greater than Medium
#

resource "cloudflare_filter" "threats" {
  zone_id     = var.zone_id
  description = "Expression to block medium threats"
  expression  = "(cf.threat_score gt 14)"
}

resource "cloudflare_firewall_rule" "threats" {
  zone_id     = var.zone_id
  description = "Firewall rule to block medium threats"
  filter_id   = cloudflare_filter.threats.id
  action      = "block"
}
