resource "aws_db_instance" "rds_instance" {  
  identifier            = random_id.db_identifier.hex
  engine                = "postgres"
  engine_version        = var.engine_version
  instance_class        = var.instance_class
  username              = var.username
  password              = local.password
  port                  = var.port
  parameter_group_name  = var.parameter_group_name
  storage_type          = var.storage_type
  allocated_storage     = var.allocated_storage
  max_allocated_storage = var.max_allocated_storage
  skip_final_snapshot   = local.skip_final_snapshot
  publicly_accessible   = false
}
