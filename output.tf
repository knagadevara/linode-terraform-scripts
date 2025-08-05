# output "EnabledOnDevices" {
#   depends_on = [linode_firewall.ssh_rule]
#   value      = linode_firewall.ssh_rule.devices
# }

output "GetBastionIP" {
  value = data.linode_instance_networking.bastion_ip.ipv4
}