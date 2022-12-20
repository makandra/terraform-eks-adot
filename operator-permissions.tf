resource "kubernetes_namespace" "operator" {
  metadata {
    name = "opentelemetry-operator-system"
    labels = {
      "control-plane" = "controller-manager"
    }
  }
}

resource "kubectl_manifest" "this" {
  count      = length(data.kubectl_file_documents.docs.manifests)
  yaml_body  = element(data.kubectl_file_documents.docs.documents, count.index)
  apply_only = true
  depends_on = [kubernetes_namespace.operator]
}
