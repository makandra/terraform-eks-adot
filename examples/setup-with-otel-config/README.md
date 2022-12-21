# setup-with-otel-config

This example configuration deploys a configuration for the adot collector with metrics from prometheus service endpoints (in this case kube-state-metrics) and the `awscontainerinsightreceiver` providing `ContainerInsights` metrics (the same metrics the AWS Cloudwatch agent provides).

The configuration pushes only a part of the available metrics. You should adapt the configuration to your own needs.

Currently we use `https://makandra.github.io/aws-otel-helm-charts/` to setup the otel collector because there are some features missing in `https://github.com/aws-observability/aws-otel-helm-charts`. As soon as these changes are merged this example can be updated.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | ~>1.14 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_adot"></a> [adot](#module\_adot) | /home/claus/code/makandra_public/terraform-eks-adot | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.adot](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [helm_release.adot-collector](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [aws_eks_cluster.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster) | data source |
| [aws_eks_cluster_auth.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster_auth) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `string` | `"eks-dev"` | no |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `"eu-central-1"` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
