output "public_subnets" {
  value = module.vpc_main.public_subnet_ids
}

output "private_subnets" {
  value = module.vpc_main.private_subnet_ids
}

output "vpc_id" {
   value = module.vpc_main.vpc_id
}

output "bastion_host_ip_addres" {
  value = module.ec2_instance.ip_address
}

output "sg_ec2" { 
  value = module.security_groupSG.id
}

output "sg_db" { 
  value = module.security_groupSG.id_db
}

output "id_rds" {
  value = module.rds_database_dev.id_rds
}

output "identifier" {
  value = module.rds_database_dev.id_database
}