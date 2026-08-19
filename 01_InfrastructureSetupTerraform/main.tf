module "vpc" {
  source = "./VPC"
}

module "ec2" {
  source                   = "./EC2"
  vpc_id                   = module.vpc.vpc_id
  public_subnet_id         = module.vpc.public_subnet_id
  private_subnet_id        = module.vpc.private_subnet_id
  security_group_id        = module.roles_and_security_groups.security_group_id
  security_group_db_id     = module.roles_and_security_groups.security_group_db_id
  aws_iam_instance_profile = module.roles_and_security_groups.aws_iam_instance_profile
  key_name                 = "my-key"
}

module "roles_and_security_groups" {
  source                  = "./Roles&SecurityGroups"
  vpc_id                  = module.vpc.vpc_id
  public_subnet_id        = module.vpc.public_subnet_id
  private_subnet_id       = module.vpc.private_subnet_id
  web_server_instance_ids = module.ec2.web_server_instance_ids
  db_server_instance_ids  = module.ec2.db_server_instance_ids
  key_name                = "my-key"
}


