output "private_subnets" {
  value = module.template.private_subnets
}

output "public_subnet_ids" {
  value = module.template.public_subnets
}

output "name" {
  value = module.template.vpc_id
}

output "host_ip_addres" {
  value = module.template.bastion_host_ip_addres
}

output "arn_cloudwatch" {
  value = module.rds_alarms_statics.cloudwatch_alarm_arns
}