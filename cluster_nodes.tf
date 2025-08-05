resource "linode_instance" "cluster_node" {
  depends_on = [linode_vpc.maa1_fabric, linode_firewall.ssh_rule]
  count      = var.k8s_instances
  region     = var.cluster_region
  #   id         = "${var.default_prefix}-NPRD-IN-MAA-KUBE-${count.index}"
  label = "${var.default_prefix}-NPRD-IN-MAA-KUBE-${count.index}"
  alerts {
    cpu = var.alerts.cpu
    io  = var.alerts.iops
  }
  tags             = var.tag_list
  firewall_id      = linode_firewall.ssh_rule.id
  backups_enabled  = false
  image            = var.linode_image
  authorized_keys  = [tostring(data.linode_sshkey.defaultKey.ssh_key)]
  authorized_users = var.authorized_users
  type             = var.instance_type
  placement_group {
    id = linode_placement_group.af_pg.id
  }
  migration_type = "cold"
  booted         = true

  interface {
    purpose   = "vpc"
    primary   = true
    subnet_id = linode_vpc_subnet.maa1_private.id
    }

  interface {
    purpose   = "vlan"
    label     = "nat-vlan"
    subnet_id = linode_vpc_subnet.maa1_vlan.id
    primary   = false
  }
}
