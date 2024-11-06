output "launch_configuration_id" {
  description = "ID of the launch configuration used by the Auto Scaling Group"
  value       = aws_launch_template.wordpress_lt.id
}

output "asg_name" {
  description = "Name of the Auto Scaling Group"
  value       = aws_autoscaling_group.wordpress_asg.name
}
