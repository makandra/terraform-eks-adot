resource "kubernetes_namespace" "operator" {
  metadata {
    name = "opentelemetry-operator-system"
    labels = {
      "control-plane" = "controller-manager"
    }
  }
}

resource "kubectl_manifest" "this" {
  count     = length(data.kubectl_filename_list.manifests.matches)
  yaml_body = file(element(data.kubectl_filename_list.manifests.matches, count.index))
}
