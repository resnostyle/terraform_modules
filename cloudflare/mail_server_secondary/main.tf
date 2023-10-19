#
## Email
#
resource "cloudflare_record" "mx77" {
  allow_overwrite = true
  zone_id         = var.zone_id
  name            = "@"
  type            = "MX"
  value           = "route2.mx.cloudflare.net"
  priority        = "77"
}

resource "cloudflare_record" "mx27" {
  allow_overwrite = true
  zone_id         = var.zone_id
  name            = "@"
  type            = "MX"
  value           = "route1.mx.cloudflare.net"
  priority        = "27"
}

resource "cloudflare_record" "mx85" {
  allow_overwrite = true
  zone_id         = var.zone_id
  name            = "@"
  type            = "MX"
  value           = "route3.mx.cloudflare.net"
  priority        = "85"
}
module "firewall" {
  source  = "../firewall"
  zone_id = var.zone_id
}
