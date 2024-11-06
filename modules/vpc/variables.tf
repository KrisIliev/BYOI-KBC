variable "availability_zones" {
  description = "List of availability zones to be used for the subnets"
  type        = list(string)
  default     = ["us-west-1a", "us-west-1b"]
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
}