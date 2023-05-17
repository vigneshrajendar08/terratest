# Create output variables to expose useful information
output "endpoint" {
  description = "The connection endpoint"
  value       = aws_db_instance.this.endpoint
}
