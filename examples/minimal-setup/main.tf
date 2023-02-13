module "adot" {
  source       = "../.."
  cert-manager = true
  cluster_name = var.cluster_name
}
