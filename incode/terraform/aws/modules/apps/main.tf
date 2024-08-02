resource "kubernetes_secret" "db_password" {
  metadata {
    name = "db_password"
  }

  data = {
    username = var.db_username
    password = var.db_password
  }

  type = "kubernetes.io/basic-auth"
}

resource "helm_release" "nginx" {
  depends_on = [ kubernetes_secret.db_password ]

  name       = "nginx"
  chart      = "nginx"
  repository = "https://helm.nginx.com/stable"
  namespace  = "testapp"
  create_namespace = true

  set {
    name  = "service.type"
    value = "LoadBalancer"
  }
}