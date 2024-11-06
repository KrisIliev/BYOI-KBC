output "db_subnet_group" {
  description = "The DB subnet group name for the RDS instance"
  value       = aws_db_subnet_group.db_subnet_group.name
}

output "rds_security_group_id" {
  description = "Security group ID for RDS access control"
  value       = aws_security_group.rds_sg[*].id
}

output "endpoint" {
  description = "The endpoint of the RDS instance"
  value       = aws_db_instance.wordpress_db.endpoint
}
