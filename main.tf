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

module "domain_sinsky_cc" {
  source = "./modules/sinsky.cc"

  cloudflare_zone_id = var.zone_id_sinsky_cc
}
