Terraform module to setup [AWS Distro for OpenTelemetry](https://aws-otel.github.io/) in an EKS cluster.

# Usage example

```
module "adot" {
  source       = "/home/claus/code/makandra_public/terraform-eks-adot"
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
