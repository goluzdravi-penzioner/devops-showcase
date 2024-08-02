resource "aws_db_instance" "database" {
  allocated_storage    = var.rds_storage
  db_name              = var.rds_db_name
  engine               = "mysql"
  engine_version       = var.rds_engine_version
  instance_class       = var.rds_instance_class
  username             = var.rds_db_username
  password             = random_password.db_password.result
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
}

resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = [ module.vpc.private_subnets ]

  tags = {
    Name = "My DB subnet group"
  }
}

resource "random_password" "db_password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "aws_secretsmanager_secret" "db_password" {
  name = "db_password"
}

resource "aws_secretsmanager_secret_version" "example" {
  secret_id     = aws_secretsmanager_secret.db_password.id
  secret_string = random_password.db_password.result
}

resource "kubernetes_secret" "db_password" {
  metadata {
    name = "db_password"
  }

  data = {
    username = var.rds_db_username
    password = random_password.db_password.result
  }

  type = "kubernetes.io/basic-auth"
}