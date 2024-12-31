variable "vpc_id" {
  description = "ID of vpc to apply the SG"
}
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


