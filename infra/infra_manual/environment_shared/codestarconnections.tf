# module "codestarconnections" {
#   source        = "../../modules/codestarconnections"
#   count         = var.codestarconnections_enable_module ? 1 : 0
#   name          = var.codestarconnections_name
#   provider_type = var.codestarconnections_provider_type
# }

module "codestarconnections_gitlab" {
  source                        = "../../modules/codestarconnections"
  count                         = var.codestarconnections_gitlab_enable_module ? 1 : 0
  name                          = var.codestarconnections_gitlab_name
  provider_type                 = var.codestarconnections_gitlab_provider_type
  codestarconnections_host_name = var.codestarconnections_gitlab_host_name
  provider_endpoint             = var.codestarconnections_gitlab_provider_endpoint
}