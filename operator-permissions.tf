resource "kubernetes_namespace" "operator" {
  metadata {
    name = "opentelemetry-operator-system"
    labels = {
      "control-plane" = "controller-manager"
    }
  }
}

resource "kubectl_manifest" "namespace" {
  yaml_body  = data.kubectl_file_documents.namespace.manifests[0]
  apply_only = true
  depends_on = [kubernetes_namespace.operator]
}

resource "kubectl_manifest" "clusterrole" {
  yaml_body  = data.kubectl_file_documents.clusterrole.manifests[0]
  apply_only = true
  depends_on = [kubernetes_namespace.operator, kubectl_manifest.namespace]
}

resource "kubectl_manifest" "clusterrolebinding" {
  yaml_body  = data.kubectl_file_documents.clusterrolebinding.manifests[0]
  apply_only = true
  depends_on = [kubernetes_namespace.operator, kubectl_manifest.namespace]
}

resource "kubectl_manifest" "rolebinding" {
  yaml_body  = data.kubectl_file_documents.rolebinding.manifests[0]
  apply_only = true
  depends_on = [kubernetes_namespace.operator, kubectl_manifest.namespace]
}

resource "kubectl_manifest" "role" {
  yaml_body  = data.kubectl_file_documents.role.manifests[0]
  apply_only = true
  depends_on = [kubernetes_namespace.operator, kubectl_manifest.namespace]
}
