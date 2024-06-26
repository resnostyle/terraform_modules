# Configure the Cloudflare provider.
# You may optionally use version directive to prevent breaking changes occurring unannounced.
terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "4.36.0"
    }
    namecheap = {
      source  = "namecheap/namecheap"
      version = ">= 2.0.0"
    }
  }
}
