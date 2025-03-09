terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5"
    }
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

resource "cloudflare_dns_record" "www" {
  name    = "www"
  ttl     = 3600
  type    = "A"
  zone_id = var.cloudflare_zone_id
  content = "100.109.137.3"
  proxied = false
  comment = "terraform Demo"
}
