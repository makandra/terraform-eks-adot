data "aws_eks_cluster" "this" {
  name = var.cluster_name
}

data "aws_iam_openid_connect_provider" "this" {
  url = data.aws_eks_cluster.this.identity[0].oidc[0].issuer
}

data "kubectl_file_documents" "docs" {
  content = file("${path.module}/files/addons-otel-permissions.yaml")
}
