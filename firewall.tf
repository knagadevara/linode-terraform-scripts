resource "linode_firewall" "ssh_rule" {
  depends_on = [linode_instance.bastion_host]
  label      = "${var.default_prefix}-FW"
  inbound {
    label       = "SSH"
    action      = "ACCEPT"
    description = "DefaultSSH-Rule"
    protocol    = "TCP"
    ports       = 22
    ipv4        = ["${linode_instance.bastion_host.ip_address}/32", linode_vpc_subnet.maa1_private.ipv4, linode_vpc_subnet.maa1_public.ipv4]
  }
  inbound_policy  = "DROP"
  outbound_policy = "ACCEPT"
  tags            = var.tag_list
}

resource "linode_firewall" "bastion_ssh_rule" {
  depends_on = [data.http.my_ipv4, data.http.my_ipv6]
  label      = "${var.default_prefix}-Jump-FW"
  inbound {
    label       = "SSH"
    action      = "ACCEPT"
    description = "DefaultSSH-Rule"
    protocol    = "TCP"
    ports       = 22
    ipv4        = [var.ip_address.ipv4 == "" ? "${data.http.my_ipv4.response_body}/32" : var.ip_address.ipv4]
    ipv6        = [var.ip_address.ipv6 == "" ? "${data.http.my_ipv6.response_body}/128" : var.ip_address.ipv6]
  }
  inbound_policy  = "DROP"
  outbound_policy = "ACCEPT"
  tags            = var.tag_list
}