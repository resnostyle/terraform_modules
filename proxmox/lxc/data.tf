provider "http" {
  alias = "github"
}

data "http" "github_ssh_key" {
  provider = http.github
  url      = "https://github.com/resnostyle.keys"
}
