terraform {
    required_providers {
        digitalocean = {
            source  = "digitalocean/digitalocean"
            version = "~> 2.0"
        }
    }
}

provider "digitalocean" {
    token = "${var.digitalocean_token}"
}

resource "digitalocean_ssh_key" "default" {
    name = "web_server_token"
    public_key = "${file("~/.ssh/id_rsa.pub")}"

}

resource "digitalocean_droplet" "web" {
    name  =  "web1"
    image =  "ubuntu-22-04-x64"
    size  =  "s-1vcpu-1gb"
    region = "lon1"
    ssh_keys =["$digitalocean_ssh_key.defaults.fingerprint}"]

}