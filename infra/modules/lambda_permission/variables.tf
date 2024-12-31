variable "statement_id" {
  description = "The statement ID for the Lambda permission"
  type        = string
}

variable "action" {
  description = "The action permitted by the Lambda permission"
  type        = string
}

variable "function_name" {
  description = "The name of the Lambda function"
  type        = string
}

variable "principal" {
  description = "The principal who is allowed to invoke the Lambda function"
  type        = string
}