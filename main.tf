provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./modules/vpc"

  availability_zones   = var.availability_zones
  private_subnet_cidrs = var.private_subnet_cidrs
  public_subnet_cidrs  = var.public_subnet_cidrs
}

module "rds" {
  source = "./modules/rds"

  db_subnet_ids          = module.vpc.public_subnet_ids
  db_security_groups     = module.rds.rds_security_group_id
  db_subnet_group        = module.rds.db_subnet_group
  db_name                = var.db_name
  db_username            = var.db_username
  db_password            = var.db_password
  vpc_security_group_ids = module.rds.rds_security_group_id
  vpc_id                 = module.vpc.vpc_id
}

module "elb" {
  source = "./modules/elb"

  subnets               = module.vpc.public_subnet_ids
  elb_subnet_ids        = module.vpc.public_subnet_ids
  elb_security_group_id = module.elb.elb_security_group_id
  vpc_id                = module.vpc.vpc_id

}

module "ec2" {
  source = "./modules/ec2"

  ami_id                = var.ami_id
  instance_type         = var.instance_type
  db_name               = var.db_name
  db_username           = var.db_username
  db_password           = var.db_password
  subnet_ids            = module.vpc.public_subnet_ids
  ec2_security_group_id = module.vpc.ec2_security_group_id
  elb_security_group_id = module.elb.elb_security_group_id
  rds_endpoint          = module.rds.endpoint
  desired_capacity      = var.desired_capacity
  max_capacity          = var.max_capacity
  min_capacity          = var.min_capacity
  target_group_arn      = module.elb.target_group_arn
  key_name              = var.key_name
}
