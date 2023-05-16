# Create output variables to expose useful information
output "rds_endpoint" {
  value       = aws_db_instance.rds_instance.endpoint
  description = "The endpoint of the RDS instance"
}
