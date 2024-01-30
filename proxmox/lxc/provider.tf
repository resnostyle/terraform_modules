terraform {
  required_providers {
    sops = {
      source  = "carlpett/sops"
      version = "1.0.0"
    }
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.46.1"
    }

  }
}

data "vault_generic_secret" "proxmox_creds" {
  path = "secret/terraform/proxmox"
}

data "sops_file" "host_secrets" {
  source_file = "../vault.sops.yaml"
}

provider "proxmox" {
  endpoint = data.vault_generic_secret.proxmox_creds.data["BGP_API_URL"]
  username = data.vault_generic_secret.proxmox_creds.data["BGP_USERNAME"]
  password = data.vault_generic_secret.proxmox_creds.data["BGP_PASSWORD"]
  insecure = true
  ssh {
    agent = true
  }
}

provider "vault" {
  address = data.sops_file.host_secrets.data["VAULT_HOST_ADDRESS"]
  token   = data.sops_file.host_secrets.data["VAULT_TOKEN"]
}
