resource "linode_instance" "bastion_host" {
  depends_on = [linode_vpc.maa1_fabric, linode_firewall.bastion_ssh_rule]
  region     = var.cluster_region
  label      = "${var.default_prefix}-bastion"
  alerts {
    cpu = var.alerts.cpu
    io  = var.alerts.iops
  }
  tags             = var.tag_list
  firewall_id      = linode_firewall.bastion_ssh_rule.id
  backups_enabled  = false
  image            = var.linode_image
  authorized_keys  = [tostring(data.linode_sshkey.defaultKey.ssh_key)]
  authorized_users = var.authorized_users
  type             = var.instance_type
  placement_group {
    id = linode_placement_group.af_pg.id
  }

  interface {
    purpose   = "vpc"
    primary   = true
    subnet_id = linode_vpc_subnet.maa1_public.id
    ipv4 {
      nat_1_1 = "any"
    }
  }

  interface {
    purpose   = "vlan"
    label     = "nat-vlan"
    subnet_id = linode_vpc_subnet.maa1_vlan.id
    primary   = false
  }

}