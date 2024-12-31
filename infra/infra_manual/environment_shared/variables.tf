variable "region" {
  description = "region"
  type        = string
  default     = "us-east-1"
}

variable "codestarconnections_enable_module" {
  description = "Habilita o deshabilita el módulo"
  type        = bool
  default     = true
}
variable "codestarconnections_name" {}
variable "codestarconnections_provider_type" {}

variable "codestarconnections_gitlab_enable_module" {
  description = "Habilita o deshabilita el módulo"
  type        = bool
  default     = true
}
variable "codestarconnections_gitlab_name" {}
variable "codestarconnections_gitlab_provider_type" {}
variable "codestarconnections_gitlab_host_name" {}
variable "codestarconnections_gitlab_provider_endpoint" {}

# Codebuild Validate
variable "codebuild_validate_name" {
  description = "The projects name."
  type        = string
}
variable "codebuild_validate_description" {
  description = "A short description of the project."
  type        = string
}
variable "codebuild_validate_environment_variables" {
  description = "A list of sets of environment variables to make available to builds for this build project."
  type        = list(any)
  default     = []
}
variable "codebuild_validate_tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}
variable "codebuild_validate_dir_buildspec" {
  description = "dir_buildspec"
  type        = string
}
variable "codebuild_validate_environment_image" {
  description = "The Docker image to use for this build project. Valid values include Docker images provided by CodeBuild (e.g `aws/codebuild/standard:2.0`), Docker Hub images (e.g. `hashicorp/terraform:latest`), and full Docker repository URIs such as those for ECR (e.g. `137112412989.dkr.ecr.us-west-2.amazonaws.com/amazonlinux:latest`)"
  type        = string
  default     = "aws/codebuild/amazonlinux2-x86_64-standard:5.0"
}
variable "codebuild_validate_environment_compute_type" {
  description = "Information about the compute resources the build project will use. Available values for this parameter are: `BUILD_GENERAL1_SMALL`, `BUILD_GENERAL1_MEDIUM`, `BUILD_GENERAL1_LARGE` or `BUILD_GENERAL1_2XLARGE`. `BUILD_GENERAL1_SMALL` is only valid if type is set to `LINUX_CONTAINER`. When type is set to `LINUX_GPU_CONTAINER`, compute_type need to be `BUILD_GENERAL1_LARGE`."
  type        = string
  default     = "BUILD_GENERAL1_MEDIUM"
}

# Codebuild Checkov
variable "codebuild_checkov_name" {
  description = "The projects name."
  type        = string
}
variable "codebuild_checkov_description" {
  description = "A short description of the project."
  type        = string
}
variable "codebuild_checkov_environment_variables" {
  description = "A list of sets of environment variables to make available to builds for this build project."
  type        = list(any)
  default     = []
}
variable "codebuild_checkov_tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}
variable "codebuild_checkov_dir_buildspec" {
  description = "dir_buildspec"
  type        = string
}
variable "codebuild_checkov_environment_image" {
  description = "The Docker image to use for this build project. Valid values include Docker images provided by CodeBuild (e.g `aws/codebuild/standard:2.0`), Docker Hub images (e.g. `hashicorp/terraform:latest`), and full Docker repository URIs such as those for ECR (e.g. `137112412989.dkr.ecr.us-west-2.amazonaws.com/amazonlinux:latest`)"
  type        = string
  default     = "aws/codebuild/amazonlinux2-x86_64-standard:5.0"
}
variable "codebuild_checkov_environment_compute_type" {
  description = "Information about the compute resources the build project will use. Available values for this parameter are: `BUILD_GENERAL1_SMALL`, `BUILD_GENERAL1_MEDIUM`, `BUILD_GENERAL1_LARGE` or `BUILD_GENERAL1_2XLARGE`. `BUILD_GENERAL1_SMALL` is only valid if type is set to `LINUX_CONTAINER`. When type is set to `LINUX_GPU_CONTAINER`, compute_type need to be `BUILD_GENERAL1_LARGE`."
  type        = string
  default     = "BUILD_GENERAL1_MEDIUM"
}

# Codebuild Tfsec
variable "codebuild_tfsec_name" {
  description = "The projects name."
  type        = string
}
variable "codebuild_tfsec_description" {
  description = "A short description of the project."
  type        = string
}
variable "codebuild_tfsec_environment_variables" {
  description = "A list of sets of environment variables to make available to builds for this build project."
  type        = list(any)
  default     = []
}
variable "codebuild_tfsec_tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}
variable "codebuild_tfsec_dir_buildspec" {
  description = "dir_buildspec"
  type        = string
}
variable "codebuild_tfsec_environment_image" {
  description = "The Docker image to use for this build project. Valid values include Docker images provided by CodeBuild (e.g `aws/codebuild/standard:2.0`), Docker Hub images (e.g. `hashicorp/terraform:latest`), and full Docker repository URIs such as those for ECR (e.g. `137112412989.dkr.ecr.us-west-2.amazonaws.com/amazonlinux:latest`)"
  type        = string
  default     = "aws/codebuild/amazonlinux2-x86_64-standard:5.0"
}
variable "codebuild_tfsec_environment_compute_type" {
  description = "Information about the compute resources the build project will use. Available values for this parameter are: `BUILD_GENERAL1_SMALL`, `BUILD_GENERAL1_MEDIUM`, `BUILD_GENERAL1_LARGE` or `BUILD_GENERAL1_2XLARGE`. `BUILD_GENERAL1_SMALL` is only valid if type is set to `LINUX_CONTAINER`. When type is set to `LINUX_GPU_CONTAINER`, compute_type need to be `BUILD_GENERAL1_LARGE`."
  type        = string
  default     = "BUILD_GENERAL1_MEDIUM"
}

# Codebuild Tflint
variable "codebuild_tflint_name" {
  description = "The projects name."
  type        = string
}
variable "codebuild_tflint_description" {
  description = "A short description of the project."
  type        = string
}
variable "codebuild_tflint_environment_variables" {
  description = "A list of sets of environment variables to make available to builds for this build project."
  type        = list(any)
  default     = []
}
variable "codebuild_tflint_tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}
variable "codebuild_tflint_dir_buildspec" {
  description = "dir_buildspec"
  type        = string
}
variable "codebuild_tflint_environment_image" {
  description = "The Docker image to use for this build project. Valid values include Docker images provided by CodeBuild (e.g `aws/codebuild/standard:2.0`), Docker Hub images (e.g. `hashicorp/terraform:latest`), and full Docker repository URIs such as those for ECR (e.g. `137112412989.dkr.ecr.us-west-2.amazonaws.com/amazonlinux:latest`)"
  type        = string
  default     = "aws/codebuild/amazonlinux2-x86_64-standard:5.0"
}
variable "codebuild_tflint_environment_compute_type" {
  description = "Information about the compute resources the build project will use. Available values for this parameter are: `BUILD_GENERAL1_SMALL`, `BUILD_GENERAL1_MEDIUM`, `BUILD_GENERAL1_LARGE` or `BUILD_GENERAL1_2XLARGE`. `BUILD_GENERAL1_SMALL` is only valid if type is set to `LINUX_CONTAINER`. When type is set to `LINUX_GPU_CONTAINER`, compute_type need to be `BUILD_GENERAL1_LARGE`."
  type        = string
  default     = "BUILD_GENERAL1_MEDIUM"
}

# Codebuild Terrascan
variable "codebuild_terrascan_name" {
  description = "The projects name."
  type        = string
}
variable "codebuild_terrascan_description" {
  description = "A short description of the project."
  type        = string
}
variable "codebuild_terrascan_environment_variables" {
  description = "A list of sets of environment variables to make available to builds for this build project."
  type        = list(any)
  default     = []
}
variable "codebuild_terrascan_tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}
variable "codebuild_terrascan_dir_buildspec" {
  description = "dir_buildspec"
  type        = string
}
variable "codebuild_terrascan_environment_image" {
  description = "The Docker image to use for this build project. Valid values include Docker images provided by CodeBuild (e.g `aws/codebuild/standard:2.0`), Docker Hub images (e.g. `hashicorp/terraform:latest`), and full Docker repository URIs such as those for ECR (e.g. `137112412989.dkr.ecr.us-west-2.amazonaws.com/amazonlinux:latest`)"
  type        = string
  default     = "aws/codebuild/amazonlinux2-x86_64-standard:5.0"
}
variable "codebuild_terrascan_environment_compute_type" {
  description = "Information about the compute resources the build project will use. Available values for this parameter are: `BUILD_GENERAL1_SMALL`, `BUILD_GENERAL1_MEDIUM`, `BUILD_GENERAL1_LARGE` or `BUILD_GENERAL1_2XLARGE`. `BUILD_GENERAL1_SMALL` is only valid if type is set to `LINUX_CONTAINER`. When type is set to `LINUX_GPU_CONTAINER`, compute_type need to be `BUILD_GENERAL1_LARGE`."
  type        = string
  default     = "BUILD_GENERAL1_MEDIUM"
}

# Codebuild Plan
variable "codebuild_plan_name" {
  description = "The projects name."
  type        = string
}
variable "codebuild_plan_description" {
  description = "A short description of the project."
  type        = string
}
variable "codebuild_plan_environment_variables" {
  description = "A list of sets of environment variables to make available to builds for this build project."
  type        = list(any)
  default     = []
}
variable "codebuild_plan_tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}
variable "codebuild_plan_dir_buildspec" {
  description = "dir_buildspec"
  type        = string
}
variable "codebuild_plan_environment_image" {
  description = "The Docker image to use for this build project. Valid values include Docker images provided by CodeBuild (e.g `aws/codebuild/standard:2.0`), Docker Hub images (e.g. `hashicorp/terraform:latest`), and full Docker repository URIs such as those for ECR (e.g. `137112412989.dkr.ecr.us-west-2.amazonaws.com/amazonlinux:latest`)"
  type        = string
  default     = "aws/codebuild/amazonlinux2-x86_64-standard:5.0"
}
variable "codebuild_plan_environment_compute_type" {
  description = "Information about the compute resources the build project will use. Available values for this parameter are: `BUILD_GENERAL1_SMALL`, `BUILD_GENERAL1_MEDIUM`, `BUILD_GENERAL1_LARGE` or `BUILD_GENERAL1_2XLARGE`. `BUILD_GENERAL1_SMALL` is only valid if type is set to `LINUX_CONTAINER`. When type is set to `LINUX_GPU_CONTAINER`, compute_type need to be `BUILD_GENERAL1_LARGE`."
  type        = string
  default     = "BUILD_GENERAL1_MEDIUM"
}

# Codebuild Apply
variable "codebuild_apply_name" {
  description = "The projects name."
  type        = string
}
variable "codebuild_apply_description" {
  description = "A short description of the project."
  type        = string
}
variable "codebuild_apply_environment_variables" {
  description = "A list of sets of environment variables to make available to builds for this build project."
  type        = list(any)
  default     = []
}
variable "codebuild_apply_tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}
variable "codebuild_apply_dir_buildspec" {
  description = "dir_buildspec"
  type        = string
}
variable "codebuild_apply_environment_image" {
  description = "The Docker image to use for this build project. Valid values include Docker images provided by CodeBuild (e.g `aws/codebuild/standard:2.0`), Docker Hub images (e.g. `hashicorp/terraform:latest`), and full Docker repository URIs such as those for ECR (e.g. `137112412989.dkr.ecr.us-west-2.amazonaws.com/amazonlinux:latest`)"
  type        = string
  default     = "aws/codebuild/amazonlinux2-x86_64-standard:5.0"
}
variable "codebuild_apply_environment_compute_type" {
  description = "Information about the compute resources the build project will use. Available values for this parameter are: `BUILD_GENERAL1_SMALL`, `BUILD_GENERAL1_MEDIUM`, `BUILD_GENERAL1_LARGE` or `BUILD_GENERAL1_2XLARGE`. `BUILD_GENERAL1_SMALL` is only valid if type is set to `LINUX_CONTAINER`. When type is set to `LINUX_GPU_CONTAINER`, compute_type need to be `BUILD_GENERAL1_LARGE`."
  type        = string
  default     = "BUILD_GENERAL1_MEDIUM"
}


# Codebuild Complete Apply
variable "codebuild_complete_apply_name" {
  description = "The projects name."
  type        = string
}
variable "codebuild_complete_apply_description" {
  description = "A short description of the project."
  type        = string
}
variable "codebuild_complete_apply_environment_variables" {
  description = "A list of sets of environment variables to make available to builds for this build project."
  type        = list(any)
  default     = []
}
variable "codebuild_complete_apply_tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}
variable "codebuild_complete_apply_dir_buildspec" {
  description = "dir_buildspec"
  type        = string
}
variable "codebuild_complete_apply_environment_image" {
  description = "The Docker image to use for this build project. Valid values include Docker images provided by CodeBuild (e.g `aws/codebuild/standard:2.0`), Docker Hub images (e.g. `hashicorp/terraform:latest`), and full Docker repository URIs such as those for ECR (e.g. `137112412989.dkr.ecr.us-west-2.amazonaws.com/amazonlinux:latest`)"
  type        = string
  default     = "aws/codebuild/amazonlinux2-x86_64-standard:5.0"
}
variable "codebuild_complete_apply_environment_compute_type" {
  description = "Information about the compute resources the build project will use. Available values for this parameter are: `BUILD_GENERAL1_SMALL`, `BUILD_GENERAL1_MEDIUM`, `BUILD_GENERAL1_LARGE` or `BUILD_GENERAL1_2XLARGE`. `BUILD_GENERAL1_SMALL` is only valid if type is set to `LINUX_CONTAINER`. When type is set to `LINUX_GPU_CONTAINER`, compute_type need to be `BUILD_GENERAL1_LARGE`."
  type        = string
  default     = "BUILD_GENERAL1_MEDIUM"
}


# Codebuild install_dotnet
variable "codebuild_install_dotnet_name" {
  description = "The projects name."
  type        = string
}
variable "codebuild_install_dotnet_description" {
  description = "A short description of the project."
  type        = string
}
variable "codebuild_install_dotnet_environment_variables" {
  description = "A list of sets of environment variables to make available to builds for this build project."
  type        = list(any)
  default     = []
}
variable "codebuild_install_dotnet_tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}
variable "codebuild_install_dotnet_dir_buildspec" {
  description = "dir_buildspec"
  type        = string
}
variable "codebuild_install_dotnet_environment_image" {
  description = "The Docker image to use for this build project. Valid values include Docker images provided by CodeBuild (e.g `aws/codebuild/standard:2.0`), Docker Hub images (e.g. `hashicorp/terraform:latest`), and full Docker repository URIs such as those for ECR (e.g. `137112412989.dkr.ecr.us-west-2.amazonaws.com/amazonlinux:latest`)"
  type        = string
  default     = "aws/codebuild/standard:7.0"
}
variable "codebuild_install_dotnet_environment_compute_type" {
  description = "Information about the compute resources the build project will use. Available values for this parameter are: `BUILD_GENERAL1_SMALL`, `BUILD_GENERAL1_MEDIUM`, `BUILD_GENERAL1_LARGE` or `BUILD_GENERAL1_2XLARGE`. `BUILD_GENERAL1_SMALL` is only valid if type is set to `LINUX_CONTAINER`. When type is set to `LINUX_GPU_CONTAINER`, compute_type need to be `BUILD_GENERAL1_LARGE`."
  type        = string
  default     = "BUILD_GENERAL1_MEDIUM"
}

# Codebuild sast_front
variable "codebuild_sast_front_name" {
  description = "The projects name."
  type        = string
}
variable "codebuild_sast_front_description" {
  description = "A short description of the project."
  type        = string
}
variable "codebuild_sast_front_environment_variables" {
  description = "A list of sets of environment variables to make available to builds for this build project."
  type        = list(any)
  default     = []
}
variable "codebuild_sast_front_tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}
variable "codebuild_sast_front_dir_buildspec" {
  description = "dir_buildspec"
  type        = string
}
variable "codebuild_sast_front_environment_image" {
  description = "The Docker image to use for this build project. Valid values include Docker images provided by CodeBuild (e.g `aws/codebuild/standard:2.0`), Docker Hub images (e.g. `hashicorp/terraform:latest`), and full Docker repository URIs such as those for ECR (e.g. `137112412989.dkr.ecr.us-west-2.amazonaws.com/amazonlinux:latest`)"
  type        = string
  default     = "aws/codebuild/amazonlinux2-x86_64-standard:5.0"
}
variable "codebuild_sast_front_environment_compute_type" {
  description = "Information about the compute resources the build project will use. Available values for this parameter are: `BUILD_GENERAL1_SMALL`, `BUILD_GENERAL1_MEDIUM`, `BUILD_GENERAL1_LARGE` or `BUILD_GENERAL1_2XLARGE`. `BUILD_GENERAL1_SMALL` is only valid if type is set to `LINUX_CONTAINER`. When type is set to `LINUX_GPU_CONTAINER`, compute_type need to be `BUILD_GENERAL1_LARGE`."
  type        = string
  default     = "BUILD_GENERAL1_MEDIUM"
}

# Codebuild sast_back
variable "codebuild_sast_back_name" {
  description = "The projects name."
  type        = string
}
variable "codebuild_sast_back_description" {
  description = "A short description of the project."
  type        = string
}
variable "codebuild_sast_back_environment_variables" {
  description = "A list of sets of environment variables to make available to builds for this build project."
  type        = list(any)
  default     = []
}
variable "codebuild_sast_back_tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}
variable "codebuild_sast_back_dir_buildspec" {
  description = "dir_buildspec"
  type        = string
}
variable "codebuild_sast_back_environment_image" {
  description = "The Docker image to use for this build project. Valid values include Docker images provided by CodeBuild (e.g `aws/codebuild/standard:2.0`), Docker Hub images (e.g. `hashicorp/terraform:latest`), and full Docker repository URIs such as those for ECR (e.g. `137112412989.dkr.ecr.us-west-2.amazonaws.com/amazonlinux:latest`)"
  type        = string
  default     = "aws/codebuild/amazonlinux2-x86_64-standard:5.0"
}
variable "codebuild_sast_back_environment_compute_type" {
  description = "Information about the compute resources the build project will use. Available values for this parameter are: `BUILD_GENERAL1_SMALL`, `BUILD_GENERAL1_MEDIUM`, `BUILD_GENERAL1_LARGE` or `BUILD_GENERAL1_2XLARGE`. `BUILD_GENERAL1_SMALL` is only valid if type is set to `LINUX_CONTAINER`. When type is set to `LINUX_GPU_CONTAINER`, compute_type need to be `BUILD_GENERAL1_LARGE`."
  type        = string
  default     = "BUILD_GENERAL1_MEDIUM"
}

variable telegram_credentials_secret_name {}