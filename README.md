Terraform module to setup [AWS Distro for OpenTelemetry](https://aws-otel.github.io/) in an EKS cluster.

# Usage example

```
module "adot" {
  source  = "makandra/adot/eks"
  # version = "1.0.0" please check which version you want to use

  cert-manager = true
  cluster_name = "my-eks-cluster"
}
```

For more detailed examples see the `examples` section.

# cert-manager

`ADOT` depends on a certificate required for authentication. Please see [ADOT prerequisites](https://docs.aws.amazon.com/eks/latest/userguide/adot-reqts.html).

AWS recommends to install `cert-manager` to the EKS cluster so that a self-signed certificate can be created.

If enabled `cert-manager` always gets deployed to the `cert-manager` namespace. If you want to configure cert-manager in more detail disable it in this module and provide your own installation.

# Permissions applied

Enabling the ADOT Operator plugin requires some permissions which AWS provides as kubernetes manifest. You can refer to it in [ADOT prerequisites](https://docs.aws.amazon.com/eks/latest/userguide/adot-reqts.html). The file is stored in this repository and is applied via `kubectl`.
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.7.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.0 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | ~>1.14 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~>2.12 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.7.0 |
| <a name="provider_helm"></a> [helm](#provider\_helm) | >= 2.0 |
| <a name="provider_kubectl"></a> [kubectl](#provider\_kubectl) | ~>1.14 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | ~>2.12 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eks_addon.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_addon) | resource |
| [aws_iam_role.adot_collector](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.CloudWatchAgentServerPolicy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [helm_release.cert-manager](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubectl_manifest.this](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubernetes_namespace.operator](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_namespace.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_service_account.adot-collector](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service_account) | resource |
| [aws_eks_cluster.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster) | data source |
| [aws_iam_openid_connect_provider.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_openid_connect_provider) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_adot_collector_policy_arns"></a> [adot\_collector\_policy\_arns](#input\_adot\_collector\_policy\_arns) | List of IAM policy ARNs to attach to the ADOT collector service account. | `list(string)` | <pre>[<br>  "arn:aws:iam::aws:policy/AmazonPrometheusRemoteWriteAccess",<br>  "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy",<br>  "arn:aws:iam::aws:policy/AWSXrayWriteOnlyAccess"<br>]</pre> | no |
| <a name="input_adot_version"></a> [adot\_version](#input\_adot\_version) | The version of the AWS Distro for OpenTelemetry addon to use. | `string` | `"v0.58.0-eksbuild.1"` | no |
| <a name="input_cert-manager"></a> [cert-manager](#input\_cert-manager) | Whether to deploy cert-manager. If enabled it always gets deployed to the cert-manager namespace. If you want to configure cert-manager in more detail disable it here and provide your own installation. | `bool` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of the EKS cluster to setup ADOT. | `string` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | The namespace to install the AWS Distro for OpenTelemetry addon. | `string` | `"adot"` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
