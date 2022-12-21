module "adot" {
  source       = "/home/claus/code/makandra_public/terraform-eks-adot"
  cert-manager = true
  cluster_name = var.cluster_name
}

resource "helm_release" "adot-collector" {
  name = "adot-collector"
  # Currently we recommend using the forked repo by makandra until open pull requests are merged.
  # After merging the open PRs https://github.com/aws-observability/aws-otel-helm-charts can be used again.
  repository       = "https://makandra.github.io/aws-otel-helm-charts/"
  chart            = "adot-exporter-for-eks-on-ec2"
  namespace        = "adot"
  version          = "0.10.0"
  create_namespace = false
  atomic           = true

  values = [
    templatefile("${path.module}/templates/adot-values.yaml.tpl", {
      region       = var.region
      cluster_name = var.cluster_name
      # the namespace regex is used to exclude metrics of those namespaces from being sent to cloudwatch
      drop_namespace_regex = "(amazon-cloudwatch|kube-system|adot|exampleapp.*|opentelemetry-operator-system)"
      log_group_name       = local.adot_log_group_name
    })
  ]
}

resource "aws_cloudwatch_log_group" "adot" {
  name              = local.adot_log_group_name
  retention_in_days = var.log_rentention_days
  kms_key_id        = var.cloudwatch_log_group_kms_key_id
}
