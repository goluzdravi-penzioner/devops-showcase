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

resource "random_password" "db_password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}