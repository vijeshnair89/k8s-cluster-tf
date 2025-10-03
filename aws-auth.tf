resource "kubernetes_config_map" "aws_auth" {
  depends_on = [module.eks]

  metadata {
    name      = "aws-auth"
    namespace = "kube-system"
  }

  data = {
    mapUsers = <<YAML
- userarn: arn:aws:iam::123456789012:root
  username: root
  groups:
    - system:masters
YAML
  }
}
