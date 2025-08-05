data "http" "my_ipv4" {
  url = "https://api.ipify.org"
}

data "http" "my_ipv6" {
  url = "https://api64.ipify.org"
}

# data "linode_firewall" "fwId" {
#   depends_on = [linode_firewall.ssh_rule]
#   id         = linode_firewall.ssh_rule.id
# }

# data "linode_vpc" "vpc_details" {
#   depends_on = [linode_vpc.maa1_fabric]
#   id         = linode_vpc.maa1_fabric.id
# }

data "linode_sshkey" "defaultKey" {
  id    = linode_sshkey.default_ssh_key.id
  label = "${var.default_prefix}-SSH-KEY"
}

data "linode_instance_networking" "bastion_ip" {
  linode_id  = linode_instance.bastion_host.id
  depends_on = [linode_instance.bastion_host]
}