variable "name" {
  description = "The projects name."
  type        = string
}
variable "billing_mode" {
  description = "billing_mode"
  type        = number
  default     = 30
}
variable "read_capacity" {
  description = "read_capacity"
  type        = number
  default     = 30
}
variable "write_capacity" {
  description = "write_capacity"
  type        = number
  default     = 30
}
variable "attributes" {
  description = "attributes"
  type = list(object({
     name = string
     type = string
  }))
}
variable "hash_key" {
  description = "hash_key"
  type        = string
}
variable "range_key" {
  description = "The projects name."
  type        = string
  default     = ""
}
variable "tags" {
  description = "Tag for the resources."
  type        = map(any)
  default = {
    Cloud     = "AWS"
    ManagedBy = "Terraform"
  }
}
