
variable "name" {
  description = "The projects name."
  type        = string
}
variable "description" {
  description = "A short description of the project."
  type        = string
  default     = null
}
variable "repository" {
  description = "The repository name"
  type        = string
}
variable "platform" {
  description = "The repository name"
  type        = string
  default     = "WEB"
}
variable "access_token" {
  type        = string
  description = <<-EOT
    The personal access token for a third-party source control system for the Amplify app.
    The personal access token is used to create a webhook and a read-only deploy key. The token is not stored.
    Make sure that the account where the token is created has access to the repository.
    EOT
  default     = null
  sensitive   = true
}
variable "oauth_token" {
  type        = string
  description = <<-EOT
    The OAuth token for a third-party source control system for the Amplify app.
    The OAuth token is used to create a webhook and a read-only deploy key.
    The OAuth token is not stored.
    EOT
  default     = null
  sensitive   = true
}
variable "basic_auth_credentials" {
  type        = string
  description = "The credentials for basic authorization for the Amplify app"
  default     = null
}

variable "enable_basic_auth" {
  type        = string
  description = "The credentials for basic authorization for the Amplify app"
  default     = false
}
variable "build_spec" {
  description = "build_spec"
  type        = string
}
# variable "custom_headers" {
#   description = "custom_headers"
#   type        = string
# }
variable "environment_variables" {
  description = "Map of environment variables for the Amplify App"
  type        = map(string)
  default     = {}
}


variable "custom_rule" {
  description = "custom_rule_source"
  type        = list(any)
  default     = []
}
# variable "branch_name" {
#   description = "branch_name"
#   type        = string
# }
variable "enable_auto_build" {
  description = "enable_auto_build"
  type        = bool
  default     = false
}

variable "domain_name" {
  description = "domain_name"
  type        = string
}

variable "dir_customhttp" {
  description = "dir_customhttp"
  type        = string
}

# variable "backend_env_name" {
#   description = "backend_env"
#   type        = string
# }

variable "branch_names" {
  description = "branch_names"
  type        = list(string)
  default     = []
}
variable "domain_names" {
  description = "domain_names"
  type        = list(string)
  default     = []
}
# variable "backend_environment_names" {
#   description = "backend_environment_name"
#   type        = list(string)
#   default     = []
# }