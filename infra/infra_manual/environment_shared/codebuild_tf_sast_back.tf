module "codebuild_tf_sast_back" {
  source                   = "../../modules/codebuild"
  name                     = var.codebuild_sast_back_name
  description              = var.codebuild_sast_back_description
  environment_variables    = [
    {
      name  = "PYHTON_FILES"
      value = "./backend/"
    },
    {
      name  = "SonarProject"
      value = "Alivi-Vision"
    },
    {
      name  = "SonarURL"
      value = "https://secure.generalsoftwareinc.com"
    },
    {
      name  = "SonarLogin"
      value = "sqp_d9a32708e7ffc99835a237bc16d885e78adcf9c4"
    }
  ]
  tags                     = var.codebuild_sast_back_tags
  dir_buildspec            = var.codebuild_sast_back_dir_buildspec
  environment_image        = var.codebuild_sast_back_environment_image
  environment_compute_type = var.codebuild_sast_back_environment_compute_type
}