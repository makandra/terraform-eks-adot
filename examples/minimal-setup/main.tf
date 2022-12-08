module "adot" {
  source       = "/home/claus/code/makandra_public/terraform-eks-adot"
  cert-manager = true
  cluster_name = var.cluster_name
}
