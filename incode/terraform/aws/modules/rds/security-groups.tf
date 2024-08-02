resource "aws_security_group" "allow_rds" {
  name        = "allow_rds"
  description = "Allow rds inbound traffic and all outbound traffic"
  vpc_id      = var.vpc_id

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_rds"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_rds" {
  security_group_id = aws_security_group.allow_rds.id
  cidr_ipv4         = var.cidr_private_subnets
  from_port         = 3306
  ip_protocol       = "tcp"
  to_port           = 3306
}
