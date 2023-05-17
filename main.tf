resource "aws_db_instance" "chukku" { 
  identifier = "gokulchukkuu1-rds-instance" 
  allocated_storage = 10
  storage_type = "gp2" 
  engine = "postgres" 
  engine_version = "13.4" 
  instance_class = "db.t3.micro" 
  name = "gokulchukkuu" 
  username = "postgres" 
  password = "password" 
  parameter_group_name = "default.postgres13" 
  publicly_accessible = false 
  skip_final_snapshot = true 
}
