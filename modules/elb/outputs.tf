output "elb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = aws_lb.wordpress_elb.dns_name
}

output "elb_zone_id" {
  description = "Zone ID of the Application Load Balancer"
  value       = aws_lb.wordpress_elb.zone_id
}

output "elb_security_group_id" {
  description = "The security group ID for the ELB"
  value       = aws_security_group.elb_sg.id
}

output "target_group_arn" {
  description = "ARN of the WordPress Target Group"
  value       = aws_lb_target_group.wordpress_tg.arn
}

output "wordpress_elb_arn" {
  description = "ARN of the Application Load Balancer"
  value       = aws_lb.wordpress_elb.arn
}