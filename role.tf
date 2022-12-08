resource "aws_iam_role" "adot_collector" {
  name = "${var.cluster_name}-adot_collector"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    },
    {
      "Effect": "Allow",
      "Principal": {
        "Federated": "${data.aws_iam_openid_connect_provider.this.arn}"
      },
      "Action": "sts:AssumeRoleWithWebIdentity",
      "Condition": {
        "StringEquals": {
          "${data.aws_eks_cluster.this.identity[0].oidc[0].issuer}:aud": "sts.amazonaws.com",
          "${data.aws_eks_cluster.this.identity[0].oidc[0].issuer}:sub": "system:serviceaccount:${var.namespace}:${local.service_account_name}"
        }
      }
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "CloudWatchAgentServerPolicy" {
  for_each   = toset(var.adot_collector_policy_arns)
  policy_arn = each.key
  role       = aws_iam_role.adot_collector.name
}
