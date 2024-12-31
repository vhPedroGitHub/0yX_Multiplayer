module "template" {
  source = "../../environment_template"

  name = var.name
  vpc_cidr = var.vpc_cidr
  azs = var.azs
  private_subnet_cidr = var.private_subnet_cidr
  public_subnet_cidr = var.public_subnet_cidr

  # ---------
  # EC2 VARS|
  # ---------
  associate_public_ip_address = var.associate_public_ip_address
  ubuntu_codename = var.ubuntu_codename
  ami_specific_id = var.ami_specific_id
  ubuntu_version = var.ubuntu_version
  instance_type = var.instance_type
  name_instance = var.name_instance
  public_key = var.public_key
  ami_type = var.ami_type

  # ---------
  # RDS VARS|
  # ---------
  instance_class = var.instance_class
  engine_version = var.engine_version
  username = var.username
  password = var.password
  dbname = var.dbname
  engine = var.engine

  # ---------------
  # SECURITY GROUP|
  # ---------------
  egress_rules = var.egress_rules
  ingress_rules = var.ingress_rules
  grup_sg_description = var.grup_sg_description
  grup_sg_name = var.grup_sg_name

  grup_sg_name_bd = var.grup_sg_name_bd
  grup_sg_description_bd = var.grup_sg_description_bd
  egress_rules_bd = var.egress_rules_bd
}