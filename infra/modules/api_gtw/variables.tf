variable "api_gtw_rest_name" {
  description = "The name of the API Gateway"
  type        = string
}

variable "api_gtw_rest_description" {
  description = "The description of the API Gateway"
  type        = string
}

variable "api_gtw_rest_path_part" {
  description = "The path part of the API Gateway resource"
  type        = string
}

variable "api_gtw_rest_http_method" {
  description = "The HTTP method for the API Gateway method"
  type        = string
}

variable "api_gtw_rest_authorization" {
  description = "The authorization type for the API Gateway method"
  type        = string
}

variable "api_gtw_rest_integration_type" {
  description = "The integration type for the API Gateway integration"
  type        = string
}

variable "api_gtw_rest_stage_name" {
  description = "The stage name for the API Gateway deployment"
  type        = string
}

variable "api_gtw_rest_integration_http_method" {
  description = "The HTTP method for the API Gateway integration"
  type        = string
}

variable "api_gtw_rest_uri" {
  description = "The URI for the API Gateway deployment"
  type        = string
}