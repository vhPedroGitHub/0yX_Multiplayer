# General vars
variable "name" {
  description = "The projects name."
  type        = string
}

variable "description" {
  description = "A short description of the project."
  type        = string
  default     = null
}

# Environment

variable "environment_compute_type" {
  description = "Information about the compute resources the build project will use. Available values for this parameter are: `BUILD_GENERAL1_SMALL`, `BUILD_GENERAL1_MEDIUM`, `BUILD_GENERAL1_LARGE` or `BUILD_GENERAL1_2XLARGE`. `BUILD_GENERAL1_SMALL` is only valid if type is set to `LINUX_CONTAINER`. When type is set to `LINUX_GPU_CONTAINER`, compute_type need to be `BUILD_GENERAL1_LARGE`."
  type        = string
  default     = "BUILD_GENERAL1_MEDIUM"
}

variable "environment_image" {
  description = "The Docker image to use for this build project. Valid values include Docker images provided by CodeBuild (e.g `aws/codebuild/standard:2.0`), Docker Hub images (e.g. `hashicorp/terraform:latest`), and full Docker repository URIs such as those for ECR (e.g. `137112412989.dkr.ecr.us-west-2.amazonaws.com/amazonlinux:latest`)"
  type        = string
  default     = "aws/codebuild/amazonlinux2-x86_64-standard:5.0"
}
variable "image_pull_credentials_type" {
  description = "image_pull_credentials_type"
  type        = string
  default     = "CODEBUILD"
}

variable "environment_variables" {
  description = "A list of sets of environment variables to make available to builds for this build project."
  type        = list(any)
  default     = []
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

variable "create_default_service_role" {
  description = "Should the default service role be created?"
  type        = bool
  default     = true
}

variable "service_role_arn" {
  description = "A predefined service role to be used"
  type        = string
  default     = null
}

variable "dir_buildspec" {
  description = "dir_buildspec"
  type        = string
}

variable "secondary_sources" {
 description = "Lista de fuentes secundarias para el proyecto de CodeBuild"
 type = list(object({
    type              = string
    source_identifier = string
    location          = string
 }))
 default = []
}

variable "secondary_source_version" {
 description = "Lista de fuentes secundarias para el proyecto de CodeBuild"
 type = list(object({
    source_identifier = string
    source_version    = string
 }))
 default = []
}

variable "cache_type" {
  description = "cache_type"
  type        = string
  default     = "NO_CACHE"
}

variable "vpc_config" {
 description = "vpc_config"
 type = list(object({
    vpc_id             = string
    subnets            = list(string)
    security_group_ids = list(string)
 }))
 default = []
}