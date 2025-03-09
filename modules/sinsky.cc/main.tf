terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5"
    }
  }
}

locals {
  dns_records = yamldecode(file("${path.module}/dns_records.yaml"))
}

resource "cloudflare_dns_record" "records" {
  for_each = local.dns_records

  zone_id  = var.cloudflare_zone_id
  name     = each.value.name
  type     = each.value.type
  content    = each.value.content
  ttl      = lookup(each.value, "ttl", 3600)
  proxied  = lookup(each.value, "proxied", false)
  priority = lookup(each.value, "priority", null)
  comment  = lookup(each.value, "comment", null)
}
