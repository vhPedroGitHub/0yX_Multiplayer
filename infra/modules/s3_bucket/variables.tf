variable "bucket_prefix" {
  description = "bucket_prefix"
  type        = string
  default     = null
}
variable "bucket" {
  description = "bucket"
  type        = string
  default     = null
}
variable "force_destroy" {
  description = "force_destroy"
  type        = bool
  default     = true
}
variable "versioning_status" {
  description = "versioning_status"
  type        = string
  default     = "Enabled"
}
variable "tags" {
  description = "Tag for the resources."
  type        = map(any)
  default = {
    Cloud     = "AWS"
    ManagedBy = "Terraform"
  }
}