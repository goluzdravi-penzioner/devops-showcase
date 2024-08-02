resource "helm_release" "nginx" {

  name       = "nginx"
  chart      = "nginx"
  repository = "https://helm.nginx.com/stable"
  namespace  = "testapp"
  create_namespace = true

  set {
    name  = "db_password"
    value = var.db_password
  }

  set {
    name  = "db_host"
    value = var.db_host
  }

  set {
    name  = "redis_host"
    value = var.redis_host
  }

}