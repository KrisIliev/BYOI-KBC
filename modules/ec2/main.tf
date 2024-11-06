# Launch Configuration for EC2 instances
resource "aws_launch_template" "wordpress_lt" {
  name_prefix   = "wordpress-lc"
  image_id      = var.ami_id
  instance_type = var.instance_type

  key_name = var.key_name

  network_interfaces {
    security_groups             = [var.ec2_security_group_id]
    associate_public_ip_address = true
  }
  iam_instance_profile {
    name = aws_iam_instance_profile.ssm_instance_profile.name
  }
  #   user_data = base64encode(<<-EOF
  #   #!/bin/bash
  #   # Update package list and install Apache, PHP, and MySQL client
  #   sudo apt-get update -y
  #   sudo apt-get install -y apache2 php php-mysql wget unzip

  #   # Remove the default Apache index file, if it exists
  #   sudo rm -f /var/www/html/index.html

  #   # Download and install WordPress
  #   wget https://wordpress.org/latest.zip -O /tmp/wordpress.zip
  #   sudo unzip /tmp/wordpress.zip -d /var/www/
  #   sudo mv /var/www/wordpress/* /var/www/html/

  #   # Set ownership and permissions
  #   sudo chown -R www-data:www-data /var/www/html
  #   sudo chmod -R 755 /var/www/html

  #   # Configure wp-config.php
  #   sudo cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
  #   sudo sed -i "s/database_name_here/${var.db_name}/" /var/www/html/wp-config.php
  #   sudo sed -i "s/username_here/${var.db_username}/" /var/www/html/wp-config.php
  #   sudo sed -i "s/password_here/${var.db_password}/" /var/www/html/wp-config.php
  #   sudo sed -i "s/localhost/${var.rds_endpoint}/" /var/www/html/wp-config.php

  #   # Restart Apache
  #   sudo systemctl restart apache2
  # EOF
  # )

  user_data = base64encode(<<-EOF
    #!/bin/bash
    sudo apt-get update -y
    sudo apt-get install -y nginx
    sudo systemctl start nginx
    sudo systemctl enable nginx
  EOF
  )


  lifecycle {
    create_before_destroy = true
  }
}

# Auto Scaling Group
resource "aws_autoscaling_group" "wordpress_asg" {
  desired_capacity = var.desired_capacity
  max_size         = var.max_capacity
  min_size         = var.min_capacity
  launch_template {
    id      = aws_launch_template.wordpress_lt.id
    version = "$Latest"
  }

  vpc_zone_identifier = var.subnet_ids
  target_group_arns   = [var.target_group_arn]

  tag {
    key                 = "Name"
    value               = "wordpress-instance"
    propagate_at_launch = true
  }

  health_check_type         = "ELB"
  health_check_grace_period = 300
}
