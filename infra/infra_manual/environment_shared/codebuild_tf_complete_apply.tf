module "codebuild_tf_complete_apply" {
  source                      = "../../modules/codebuild"
  name                        = var.codebuild_complete_apply_name
  description                 = var.codebuild_complete_apply_description
  environment_variables       = var.codebuild_complete_apply_environment_variables
  tags                        = var.codebuild_complete_apply_tags
  dir_buildspec               = var.codebuild_complete_apply_dir_buildspec
  environment_image           = var.codebuild_complete_apply_environment_image
  image_pull_credentials_type = "SERVICE_ROLE"
  environment_compute_type    = var.codebuild_complete_apply_environment_compute_type
  cache_type                  = "S3"
}   