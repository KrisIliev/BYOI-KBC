resource "aws_db_instance" "wordpress_db" {
  allocated_storage       = var.db_allocated_storage
  engine                  = var.db_engine
  engine_version          = var.db_engine_version
  instance_class          = var.db_instance_class
  db_name                 = var.db_name
  username                = var.db_username
  password                = var.db_password
  multi_az                = var.db_multi_az
  publicly_accessible     = false
  backup_retention_period = var.db_backup_retention_period
  vpc_security_group_ids  = [aws_security_group.rds_sg.id]           # Use VPC security group ID(s)
  db_subnet_group_name    = aws_db_subnet_group.db_subnet_group.name # Reference the DB Subnet Group
  skip_final_snapshot     = true
  tags = {
    Name = "wordpress-rds-db"
  }
}


resource "aws_security_group" "rds_sg" {
  name_prefix = "wordpress-rds-sg"
  vpc_id      = var.vpc_id

  # Allow inbound MySQL access from EC2 instances within the same VPC
  ingress {
    from_port = 3306
    to_port   = 3306
    protocol  = "tcp"
  }

  # Allow outbound traffic for RDS
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "wordpress-rds-sg"
  }
}

resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "wordpress-db-subnet-group"
  subnet_ids = var.db_subnet_ids

  tags = {
    Name = "wordpress-db-subnet-group"
  }
}
