resource "linode_vpc" "maa1_fabric" {
  label  = "${var.default_prefix}-VPC"
  region = var.cluster_region
  lifecycle {
    create_before_destroy = false
  }
  description = "Default VPC Fabric"
}

resource "linode_vpc_subnet" "maa1_public" {
  depends_on = [linode_vpc.maa1_fabric]
  vpc_id     = linode_vpc.maa1_fabric.id
  label      = "${var.default_prefix}-PUB-SubNet"
  ipv4       = var.public_subnet
}

resource "linode_vpc_subnet" "maa1_private" {
  depends_on = [linode_vpc.maa1_fabric]
  vpc_id     = linode_vpc.maa1_fabric.id
  label      = "${var.default_prefix}-PVT-SubNet"
  ipv4       = var.private_subnet
}

resource "linode_vpc_subnet" "maa1_vlan" {
  depends_on = [linode_vpc.maa1_fabric]
  vpc_id     = linode_vpc.maa1_fabric.id
  label      = "${var.default_prefix}-VLAN-SubNet"
  ipv4       = var.vlan_subnet
}