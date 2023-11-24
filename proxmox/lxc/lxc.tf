resource "proxmox_virtual_environment_container" "lxc" {

  lifecycle {
    ignore_changes = [
      initialization[0].user_account[0],
      node_name,
      vm_id,
      disk[0].datastore_id,
      unprivileged,
      operating_system
    ]
  }
  description  = "Managed by Terraform"
  node_name    = var.node_name
  unprivileged = true
  vm_id        = var.vm_id

  initialization {
    hostname = var.hostname
    dns {
      server = var.dns_server
    }
    ip_config {
      ipv4 {
        address = "${var.ip_address}/32"
        gateway = var.gateway
      }
    }
    user_account {
      keys = [
        data.http.github_ssh_key.body
      ]
      password = random_password.container_password.result
    }
  }
  cpu {
    architecture = "amd64"
    cores        = var.cores
    units        = var.ram
  }
  memory {
    dedicated = var.ram
    swap      = 0
  }
  network_interface {
    name = "veth0"
  }
  operating_system {
    template_file_id = var.template_id
    type             = "debian"
  }
  disk {
    datastore_id = var.datastore_id
    size         = var.datastore_size
  }
}
