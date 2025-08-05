terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
      version = "3.1.1"
    }
  }
}

provider "linode" {
  config_profile = "default"
  config_path    = "~/.config/linode.cfg"
}