
#### VPC ####
variable "aws_region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
}


variable "availability_zones" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b"]
}

#### RDS ####
variable "db_name" {
  default = "wordpress_db"
}

variable "db_username" {
  default = "admin"
}

variable "db_password" {
  sensitive = true
}



#### EC2 - ASG ####
variable "ami_id" {
  description = "The AMI ID to use for EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for WordPress"
  type        = string
  default     = "t2.micro"
}

variable "desired_capacity" {
  description = "Desired number of EC2 instances in the ASG"
  type        = number
  default     = 2
}

variable "max_capacity" {
  description = "Maximum number of EC2 instances in the ASG"
  type        = number
  default     = 4
}

variable "min_capacity" {
  description = "Minimum number of EC2 instances in the ASG"
  type        = number
  default     = 1
}

variable "key_name" {
  description = "The SSH key pair name to use for SSH access to EC2 instances"
  type        = string
}
