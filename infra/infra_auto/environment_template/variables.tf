# ---------
# VPC VARS|
# ---------
variable "name" {
  type = string
  default = ""
  description = "vpc name"
}
variable "vpc_cidr" {
  description = "vpc custom cidr block"
}
variable "azs" {
  description = "availability zones for subnets"
  type        = list(string)
}
variable "private_subnet_cidr" {
  description = "private_subnet_cidr"
  type        = list(string)
}
variable "public_subnet_cidr" {
  description = "public subnet cidr"
  type        = list(string)
}
variable "tags" {
  description = "Tag for the resources."
  type        = map(any)
  default = {
    Cloud     = "AWS"
    ManagedBy = "Terraform"
  }
}

# ---------
# EC2 VARS|
# ---------
variable instance_type {
  type    = string   
}

variable name_instance {
  type    = string 
}
variable associate_public_ip_address {
  type    = bool 
}
variable "iam_instance_profile" {
  type    = string
  default = null
}
variable "vpc_security_group_ids" {
  type    = list(string)
  default = []
}
variable "ami_type" {
  description = "Type of AMI to use: 'amazon-linux' or 'ubuntu'"
  default     = "amazon-linux"
}
variable "ubuntu_codename" {
  type    = string
  default = "jammy"
}
variable "ubuntu_version" {
  type    = string
  default = "22.04"
}
variable "ami_specific_id" {
  type    = string
  description = "Type of AMI to use: 'amazon-linux' or 'ubuntu'"
  default     = null
}
variable "public_key" {
  type    = string
}

# ---------
# RDS VARS|
# ---------
variable "engine" {}
variable "engine_version" {}
variable "instance_class" {}
variable "dbname" {}
variable "username" {}
variable "password" {}

# ---------------
# SECURITY GROUP|
# ---------------
variable "grup_sg_name" {
  description = "The name of SG"
}
variable "grup_sg_description" {
  description = "Brief description of SG"
  default     = "security groups"
}
variable "ingress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = []
}
variable "egress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = []
}

variable "grup_sg_name_bd" {
  description = "The name of SG"
}
variable "grup_sg_description_bd" {
  description = "Brief description of SG"
  default     = "security groups"
}

variable "egress_rules_bd" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = []
}