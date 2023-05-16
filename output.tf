# Create output variables to expose useful information
output "rds_endpoint" {
  value       = aws_db_instance.rds_instance.endpoint
  description = "The endpoint of the RDS instance"
}
output "id" {
  description = "The RDS instance ID"
  value       = aws_db_instance.id
}
output "arn" {
  description = "The ARN of the RDS instance"
  value       = aws_db_instance.arn
}

