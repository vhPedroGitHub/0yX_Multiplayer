variable "function_name" {
  description = "function_name"
  type        = string
}
variable "handler" {
  description = "handler"
  type        = string
  default     = "FunctionHandler"
}
variable "runtime" {
  description = "runtime"
  type        = string
  default     = "dotnet8"
}
variable "timeout" {
  description = "timeout"
  type        = string
  default     = 300
}
variable "memory_size" {
  description = "memory_size"
  type        = string
  default     = 512
}

variable "environment_variables" {
  description = "A list of sets of environment variables"
  type        = map(string)
  default     = {}
}

variable "lambda_path" {
  description = "layer_path"
  type        = string
}
variable "lambda_zip_name" {
  description = "layer_zip_name"
  type        = string
}
# variable "aws_s3_object_source_zip_name" {
#   description = "aws_s3_object_source"
#   type        = string
# }
variable "packaging_file" {
  description = "packaging_file"
  type        = string
  default     = "packaging_dotnet.sh"
}

#Borrar cuando se resuelva lo de las layers
variable "source_dir" {
  description = "source_dir"
  type        = string
  default     = "../../../../backend/"
}

variable "subnets" {
  description = "subnets"
  type        = list(string)
  default = []
}
variable "sg_ids" {
  description = "sg_ids"
  type        = list(string)
  default = []
}
