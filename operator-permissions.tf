resource "kubernetes_namespace" "operator" {
  metadata {
    name = "opentelemetry-operator-system"
    labels = {
      "control-plane" = "controller-manager"
    }
  }
}

resource "kubectl_manifest" "this" {
  for_each   = data.kubectl_file_documents.docs.manifests
  yaml_body  = each.value
  apply_only = true
  depends_on = [kubernetes_namespace.operator]
}
