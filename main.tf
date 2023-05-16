#locals {
  
 #password                = local.is_read_replica ? "" : var.snapshot_identifier == null ? local.pitr_restore == false ? random_id.password.hex : "" : ""
 #skip_final_snapshot     = local.is_read_replica ? true : var.skip_final_snapshot

#}  

resource "aws_db_instance" "rds_instance" {  
  #identifier            = random_id.db_identifier.hex
  engine                = "postgres"
  engine_version        = var.engine_version
  instance_class        = var.instance_class
  username              = var.username
  password              = var.password
  port                  = var.port
  parameter_group_name  = var.parameter_group_name
  storage_type          = var.storage_type
  allocated_storage     = var.allocated_storage
  max_allocated_storage = var.max_allocated_storage
  skip_final_snapshot   = var.skip_final_snapshot
  publicly_accessible   = false
}
