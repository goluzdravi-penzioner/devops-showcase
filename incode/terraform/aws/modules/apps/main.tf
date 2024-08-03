resource "helm_release" "testapp" {

  name       = "testapp"
  chart      = "../../helm/testapp"
  namespace  = "testapp"
  create_namespace = true
  reuse_values = true

  # lifecycle {
  #   ignore_changes = [
  #     "chart"
  #   ]
  # }

  set {
    name  = "db_password"
    value = var.db_password
  }

  set {
    name  = "db_host"
    value = var.db_host
  }

  set {
    name  = "db_name"
    value = var.db_name
  }

  set {
    name  = "db_username"
    value = var.db_username
  }

  set {
    name  = "redis_host"
    value = var.redis_host
  }
}