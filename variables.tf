variable "cluster_name" {
  description = "Name of the EKS cluster to setup ADOT."
  type        = string
}

variable "adot_version" {
  description = "The version of the AWS Distro for OpenTelemetry addon to use."
  type        = string
  default     = "v0.58.0-eksbuild.1"
}

variable "namespace" {
  description = "The namespace to install the AWS Distro for OpenTelemetry addon."
  type        = string
  default     = "adot"
}

variable "cert-manager" {
  description = "Whether to deploy cert-manager. If enabled it always gets deployed to the cert-manager namespace. If you want to configure cert-manager in more detail disable it here and provide your own installation."
  type        = bool
}

variable "adot_collector_policy_arns" {
  description = "List of IAM policy ARNs to attach to the ADOT collector service account."
  type        = list(string)
  default = [
    "arn:aws:iam::aws:policy/AmazonPrometheusRemoteWriteAccess",
    "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy",
    "arn:aws:iam::aws:policy/AWSXrayWriteOnlyAccess"
  ]
}
