variable "default_prefix" {
  type    = string
  default = "TEST-CREACT"
}

variable "k8s_instances" {
  type    = number
  default = 3
}

variable "cluster_region" {
  type    = string
  default = "in-maa"
}

variable "tag_list" {
  type    = list(string)
  default = ["CREACT", "EMPLOYEE", "NON-PRODUCTION"]
}

variable "vlan_subnet" {
  type    = string
  default = "192.168.10.0/24"
}

variable "private_subnet" {
  type    = string
  default = "10.100.1.0/24"
}

variable "public_subnet" {
  type    = string
  default = "10.100.2.0/24"
}

variable "linode_image" {
  type    = string
  default = "linode/rocky9"
}

variable "ssh_key_path" {
  type    = string
  default = "~/.ssh/LinodeGeneralSSH.pub"
}

variable "alerts" {
  type = object({
    cpu  = number
    iops = number
  })
  default = {
    cpu  = 80
    iops = 1000
  }
}

variable "authorized_users" {
  type    = list(string)
  default = ["snagadev"]
}

variable "instance_type" {
  type        = string
  default     = "g6-standard-1"
  description = "Standard Available type"
}

variable "ip_address" {
  type = object({
    ipv4 = string
    ipv6 = string
  })
  default = {
    ipv4 = ""
    ipv6 = ""
  }
}

variable "cld_profile" {
  type = object({
  config_profile = string
  config_path    = string
  })
  default = {
      config_profile = "snagadev"
  config_path    = "/Users/snagadev/.config/linode.cfg"
  }
}