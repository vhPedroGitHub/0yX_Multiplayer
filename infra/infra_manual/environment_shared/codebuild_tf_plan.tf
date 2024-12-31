module "codebuild_tf_plan" {
  source                   = "../../modules/codebuild"
  name                     = var.codebuild_plan_name
  description              = var.codebuild_plan_description
  environment_variables    = var.codebuild_plan_environment_variables
  tags                     = var.codebuild_plan_tags
  dir_buildspec            = var.codebuild_plan_dir_buildspec
  environment_image        = var.codebuild_plan_environment_image
  environment_compute_type = var.codebuild_plan_environment_compute_type
  cache_type               = "S3"
}