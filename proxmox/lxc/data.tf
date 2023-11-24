resource "random_password" "container_password" {
  length           = 16
  override_special = "_%@"
  special          = true
}

output "container_password" {
  value     = random_password.container_password.result
  sensitive = true
}

provider "http" {
  alias = "github"
}

data "http" "github_ssh_key" {
  provider = http.github
  url      = "https://github.com/resnostyle.keys"
}
