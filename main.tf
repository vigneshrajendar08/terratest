resource "aws_db_instance" "rds_instance" {
  db_name           = var.db_name
  username          = var.username
}
