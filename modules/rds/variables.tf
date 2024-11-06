variable "db_name" {
  description = "The name of the WordPress database"
  type        = string
  default     = "wordpress_db"
}

variable "db_username" {
  description = "The master username for the RDS instance"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "The master password for the RDS instance"
  type        = string
  sensitive   = true
}

variable "db_engine" {
  description = "The database engine to use for the RDS instance (e.g., mysql, postgres)"
  type        = string
  default     = "mysql"
}

variable "db_engine_version" {
  description = "The version of the database engine"
  type        = string
  default     = "5.7"
}

variable "db_instance_class" {
  description = "The instance class for the RDS instance (e.g., db.t3.micro, db.t3.small)"
  type        = string
  default     = "db.t3.micro"
}

variable "db_allocated_storage" {
  description = "The amount of storage (in GB) to allocate to the RDS instance"
  type        = number
  default     = 20
}

variable "db_multi_az" {
  description = "Whether to enable Multi-AZ deployment for the RDS instance"
  type        = bool
  default     = true
}

variable "db_publicly_accessible" {
  description = "Whether the RDS instance is publicly accessible"
  type        = bool
  default     = false
}

variable "db_backup_retention_period" {
  description = "The number of days to retain backups for the RDS instance"
  type        = number
  default     = 7
}

variable "db_backup_window" {
  description = "The daily time range during which automated backups are created"
  type        = string
  default     = "02:00-03:00"
}

variable "db_maintenance_window" {
  description = "The weekly time range during which system maintenance can occur"
  type        = string
  default     = "Sun:03:00-Sun:04:00"
}

variable "db_subnet_group" {
  description = "The DB subnet group for the RDS instance, must include only private subnets"
  type        = string
}

variable "db_security_groups" {
  description = "List of security groups assigned to the RDS instance"
  type        = list(string)
}

variable "db_subnet_ids" {
  description = "List of private subnet IDs for the RDS subnet group"
  type        = list(string)
}

variable "vpc_security_group_ids" {
  description = "List of VPC security group IDs for the RDS instance"
  type        = list(string)
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}
