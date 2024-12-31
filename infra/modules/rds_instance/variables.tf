variable "engine" {}
variable "engine_version" {}
variable "instance_class" {}
variable "dbname" {}
variable "username" {}
variable "password" {}
variable "security_group" {
  type = list(string)
}
variable "name" {}
variable subnet_ids {
  type = list(string)
  description = "subnet_ids"
}
variable tags {
  description = "tags"
  type        = map(any)
  default = {
    ManagedBy = "Terraform"
  }
}