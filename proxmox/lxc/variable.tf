variable "node_name" {}
variable "vm_id" {}
variable "hostname" {}
variable "ip_address" {}
variable "cores" {}
variable "ram" {}
variable "template_id" {}
variable "dns_server" {
  type    = string
  default = "192.168.2.2"
}
variable "gateway" {
  type    = string
  default = "192.168.2.1"
}

variable "datastore_id" {
  type    = string
  default = "backup-nas"
}

variable "datastore_size" {
  type    = string
  default = "4"
}
