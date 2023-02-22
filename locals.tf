locals {
  service_account_name = "adot-collector"
  oidc_identity        = trim(data.aws_eks_cluster.this.identity[0].oidc[0].issuer, "https://")
}
