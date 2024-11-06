# BYOI-KBC WordPress Deployment
This repository contains Terraform configuration files for deploying a highly available, scalable Nginx application on Amazon Web Services (AWS).

Unfortunately I did not have enough time to make it deploy Wordpress so I have just put Nginx as an example.

## Architecture Overview
The deployment includes the following AWS components:

- VPC: A Virtual Private Cloud with both public and private subnets across multiple Availability Zones for high availability.
- Public Subnets: Host the Application Load Balancer (ALB) and NAT Gateway for managing external traffic.
- EC2 Instances: Auto Scaling Group for WordPress instances, configured to scale based on demand.
- RDS (MySQL): Managed MySQL database with Multi-AZ deployment for high availability.
- ALB (Application Load Balancer): Distributes incoming HTTP requests across EC2 instances.
- Security Groups: Control inbound and outbound traffic to ensure secure access.

## Good Practices used:

- IaC - using terraform for well organized code into reusable modules.
- Security - IAM role for EC2 instances to securely access without hardcoding credentials
- Network Security - Security groups to limit access, allowing only necessary traffic.
- Scalability - ASG for EC2 instances automatic scaling.
- Availability - Multi AZ Deployment.
- Load Balancing


## What could I improve:

- Add a way to install and import wordpress website
- Add RDS to a private subnet
- TLS
