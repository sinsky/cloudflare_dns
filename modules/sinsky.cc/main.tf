terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5"
    }
  }
}

locals {
  mail_dns = yamldecode(file("${path.module}/mail_records.yaml"))
  tailscale_dns = yamldecode(file("${path.module}/tailscale_records.yaml"))
  dns_records = merge(local.mail_dns, local.tailscale_dns)
}

resource "cloudflare_dns_record" "records" {
  for_each = local.dns_records

  zone_id  = var.cloudflare_zone_id
  name     = each.value.name
  type     = each.value.type
  content    = each.value.content
  ttl      = lookup(each.value, "ttl", 1) // Default to Auto = 1
  proxied  = lookup(each.value, "proxied", false)
  priority = lookup(each.value, "priority", null)
  comment  = lookup(each.value, "comment", null)
}
