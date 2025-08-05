resource "linode_sshkey" "default_ssh_key" {
  label   = "${var.default_prefix}-SSH-KEY"
  ssh_key = chomp(file(var.ssh_key_path))
}