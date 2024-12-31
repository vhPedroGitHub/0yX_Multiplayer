module "codebuild_tf_validate" {
  source                   = "../../modules/codebuild"
  name                     = var.codebuild_validate_name
  description              = var.codebuild_validate_description
  environment_variables    = var.codebuild_validate_environment_variables
  tags                     = var.codebuild_validate_tags
  dir_buildspec            = var.codebuild_validate_dir_buildspec
  environment_image        = var.codebuild_validate_environment_image
  environment_compute_type = var.codebuild_validate_environment_compute_type
}