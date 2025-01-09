# Create the EC2 and Database instances.

# Module to create the Security Group
module "security_groupSG" {
  source = "../../modules/security_group"

  vpc_id = module.vpc_main.vpc_id
  grup_sg_name = var.grup_sg_name
  grup_sg_description = var.grup_sg_description
  ingress_rules = var.ingress_rules
  egress_rules = var.egress_rules

  grup_sg_name_bd = var.grup_sg_name_bd
  grup_sg_description_bd = var.grup_sg_description_bd
  egress_rules_bd = var.egress_rules_bd
}

# Module to create the ec2 instance
module "ec2_instance" {    
  source = "../../modules/ec2"

  associate_public_ip_address = var.associate_public_ip_address
  # iam_instance_profile        = var.iam_instance_profile
  ubuntu_codename             = var.ubuntu_codename
  ami_specific_id             = var.ami_specific_id
  ubuntu_version              = var.ubuntu_version
  instance_type               = var.instance_type
  name_instance               = var.name_instance
  public_key                  = var.public_key
  subnet_id                   = module.vpc_main.public_subnet_ids[0]
  ami_type                    = var.ami_type
  vpc_security_group_ids      = [module.security_groupSG.id]
  user_data                   = var.user_data

}

# Module to create the RDS instance
module "rds_database_dev" {
  source = "../../modules/rds_instance"

  instance_class = var.instance_class
  engine_version = var.engine_version
  username       = var.username
  password       = var.password
  dbname         = var.dbname
  engine         = var.engine
  name           = var.name
  subnet_ids     = module.vpc_main.private_subnet_ids
  security_group = [module.security_groupSG.id, module.security_groupSG.id_db]
}