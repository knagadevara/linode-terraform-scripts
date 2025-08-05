resource "linode_placement_group" "af_pg" {
  label                = "${var.default_prefix}-PlacementGroup"
  placement_group_type = "anti_affinity:local"
  region               = var.cluster_region
}
