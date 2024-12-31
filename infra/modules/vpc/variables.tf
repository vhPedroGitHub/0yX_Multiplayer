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
