# resource "helm_release" "metrics_server" {
#   depends_on = [ aws_eks_node_group.example ]
#   name       = "metrics-server"
#   verify     = false

#   repository = "https://charts.bitnami.com/bitnami"
#   chart      = "metrics-server"
#   set {
#     name  = "livenessProbe.enabled"
#     value = false
#   }
#   set {
#     name  = "readinessProbe.enabled"
#     value = false
#   }
# }