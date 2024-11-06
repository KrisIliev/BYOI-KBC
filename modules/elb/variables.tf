variable "elb_subnet_ids" {
  description = "List of public subnet IDs for the ELB"
  type        = list(string)
}

variable "elb_security_group_id" {
  description = "Security group ID for the ELB"
  type        = string
}

variable "elb_health_check_target" {
  description = "The target for the ELB health check (e.g., HTTP:80/)"
  type        = string
  default     = "HTTP:80/"
}

variable "elb_health_check_interval" {
  description = "The time between health checks of an individual instance (in seconds)"
  type        = number
  default     = 30
}

variable "elb_health_check_timeout" {
  description = "The amount of time, in seconds, during which no response means a failed health check"
  type        = number
  default     = 5
}

variable "elb_healthy_threshold" {
  description = "The number of consecutive health checks successes required before considering an instance healthy"
  type        = number
  default     = 2
}

variable "elb_unhealthy_threshold" {
  description = "The number of consecutive health check failures required before considering an instance unhealthy"
  type        = number
  default     = 2
}

variable "subnets" {
  description = "List of public subnet IDs for the ELB"
  type        = list(string)
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}
