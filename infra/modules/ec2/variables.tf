variable instance_type {
  type    = string   
}
variable subnet_id {
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
variable tags {
  description = "tags"
  type        = map(any)
  default = {
    ManagedBy = "Terraform"
  }
}

variable "user_data" {
  type    = string
  default = null
}