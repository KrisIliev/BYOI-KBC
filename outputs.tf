output "rds_endpoint" {
  description = "The endpoint of the RDS instance"
  value       = module.rds.endpoint # This references the output from the RDS module
}

output "elb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = module.elb.elb_dns_name
}