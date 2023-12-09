terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

variable "digitalocean_token" {}

provider "digitalocean" {
  token = var.digitalocean_token
}

resource "digitalocean_ssh_key" "default" {
  name       = "ssh key"
  public_key = file("~/.ssh/id_rsa.pub")

}

resource "digitalocean_droplet" "node1" {
  name     = "web1"
  image    = "ubuntu-22-04-x64"
  size     = "s-1vcpu-1gb"
  region   = "lon1"
  ssh_keys = [digitalocean_ssh_key.default.fingerprint]

}

output "ipv4_address" {
  value = digitalocean_droplet.node1.ipv4_address
}
