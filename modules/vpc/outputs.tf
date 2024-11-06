output "public_subnets" {
  description = "Public Subnets IDs"
  value       = aws_subnet.public_subnet[*].id
}

output "private_subnets" {
  description = "Private Subnets IDs"
  value       = aws_subnet.public_subnet[*].id
}

output "public_subnet_ids" {
  description = "List of public subnet IDs"
  value       = aws_subnet.public_subnet[*].id
}

output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.wordpress_vpc.id
}

output "ec2_security_group_id" {
  description = "The security group ID for EC2 instances"
  value       = aws_security_group.ec2_sg.id
}

# output "private_subnet_ids" {
#   description = "List of private subnet IDs"
#   value       = aws_subnet.private_subnet[*].id
# }
