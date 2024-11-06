variable "ami_id" {
  description = "The AMI ID to use for the WordPress EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for WordPress"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the Auto Scaling Group"
  type        = list(string)
}

variable "ec2_security_group_id" {
  description = "Security group ID for EC2 instances"
  type        = string
}

variable "elb_security_group_id" {
  description = "Security group ID for the ELB to allow access to EC2 instances"
  type        = string
}

variable "rds_endpoint" {
  description = "RDS endpoint for the WordPress database"
  type        = string
}

variable "db_name" {
  description = "Database name for WordPress"
  type        = string
}

variable "db_username" {
  description = "Database username for WordPress"
  type        = string
}

variable "db_password" {
  description = "Database password for WordPress"
  type        = string
  sensitive   = true
}

variable "desired_capacity" {
  description = "Desired number of EC2 instances in the ASG"
  type        = number
}

variable "max_capacity" {
  description = "Maximum number of EC2 instances in the ASG"
  type        = number
}

variable "min_capacity" {
  description = "Minimum number of EC2 instances in the ASG"
  type        = number
}

variable "target_group_arn" {
  description = "ARN of the Target Group to attach instances to"
  type        = string
}

variable "key_name" {
  description = "The SSH key pair name to use for SSH access to EC2 instances"
  type        = string
}