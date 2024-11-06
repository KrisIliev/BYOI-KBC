#!/bin/bash
yum update -y
yum install -y httpd php php-mysqlnd
service httpd start

# Download WordPress files from S3 and configure wp-config.php
#aws s3 cp s3://${wordpress_s3_bucket}/wordpress.zip /tmp/wordpress.zip
unzip /tmp/wordpress.zip -d /var/www/html
chown -R apache:apache /var/www/html

# Set up database configuration in wp-config.php
sed -i "s/database_name_here/${DB_NAME}/" /var/www/html/wp-config.php
sed -i "s/username_here/${DB_USERNAME}/" /var/www/html/wp-config.php
sed -i "s/password_here/${DB_PASSWORD}/" /var/www/html/wp-config.php
sed -i "s/localhost/${DB_HOST}/" /var/www/html/wp-config.php
