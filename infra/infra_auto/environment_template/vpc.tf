module "vpc_main" {
  source              = "../../modules/vpc"

  name                = var.name
  vpc_cidr            = var.vpc_cidr
  azs                 = var.azs 
  private_subnet_cidr = var.private_subnet_cidr
  public_subnet_cidr  = var.public_subnet_cidr 
}