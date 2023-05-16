resource "aws_db_instance" "rds_instance" {
  db_name           = var.db_name
  username          = var.username
}

module "my_rds" {
  source    = "./modules/aws-rds"
  db_name   = "database"
  username  = "admin"
  # Provide values for other input variables
}
