#
## Email
#
resource "cloudflare_record" "mx0" {
  allow_overwrite = true
  zone_id         = var.zone_id
  name            = "@"
  type            = "MX"
  value           = "isaac.mx.cloudflare.net"
  priority        = "4"
}

resource "cloudflare_record" "mx10" {
  allow_overwrite = true
  zone_id         = var.zone_id
  name            = "@"
  type            = "MX"
  value           = "linda.mx.cloudflare.net"
  priority        = "23"
}

resource "cloudflare_record" "mx20" {
  allow_overwrite = true
  zone_id         = var.zone_id
  name            = "@"
  type            = "MX"
  value           = "amir.mx.cloudflare.net"
  priority        = "94"
}

resource "cloudflare_record" "txt" {
  allow_overwrite = true
  zone_id         = var.zone_id
  name            = "@"
  type            = "TXT"
  value           = "v=spf1 include:_spf.mx.cloudflare.net ~all"
}

module "firewall" {
  source  = "../firewall"
  zone_id = var.zone_id
}
