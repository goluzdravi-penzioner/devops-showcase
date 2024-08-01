resource "aws_security_group" "ClusterSharedNodeSecurityGroup" {
  name        = "ClusterSharedNodeSecurityGroup"
  description = "Communication between the control plane and worker nodegroups"
  vpc_id      = var.vpc_id
  
  ingress {
    description = "Allow managed and unmanaged nodes to communicate with each other"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    security_groups = [aws_eks_cluster.devops-bg.vpc_config[0].cluster_security_group_id]
    cidr_blocks = ["10.0.17.0/24", "10.0.18.0/24"]
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "controlplane_to_nodes"
  }
}

resource "aws_security_group" "ControlPlaneSecurityGroup" {
  name        = "ControlPlaneSecurityGroup"
  description = "Communication between all worker nodes"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow nodes to communicate with each other (all ports)"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    self        = true
    cidr_blocks = ["10.0.17.0/24", "10.0.18.0/24"]
  }

  tags = {
    Name = "cluster_shared_node_sg"
  }
}
########################### SG rules #################################################

resource "aws_security_group_rule" "IngressDefaultClusterToNodeSG" {
  type = "ingress" 
  from_port   = 0
  to_port     = 65535
  protocol    = "-1"
  security_group_id = aws_eks_cluster.devops-bg.vpc_config.0.cluster_security_group_id
  source_security_group_id = aws_security_group.ClusterSharedNodeSecurityGroup.id
}