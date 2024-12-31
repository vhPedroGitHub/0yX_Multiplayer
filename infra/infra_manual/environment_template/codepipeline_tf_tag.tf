module "codepipeline_tf_tag" {
  source                                            = "../../modules/codepipeline"
  count                                             = var.codepipeline_tf_tag_enable_module ? 1 : 0
  name                                              = var.codepipeline_tf_tag_name
  codestarconnections_arn                           = data.aws_codestarconnections_connection.connection.arn
  full_repository_id                                = var.codepipeline_tf_tag_full_repository_id
  source_branch                                     = var.codepipeline_tf_tag_source_branch
  tags                                              = var.codepipeline_tf_tag_tags
  stages                                            = var.codepipeline_tf_tag_stages
  trigger_git_conf_push_branches_includes           = var.codepipeline_tf_tag_trigger_git_conf_push_branches_includes
  trigger_git_conf_push_branches_excludes           = var.codepipeline_tf_tag_trigger_git_conf_push_branches_excludes
  trigger_git_conf_push_file_paths_includes         = var.codepipeline_tf_tag_trigger_git_conf_push_file_paths_includes
  trigger_git_conf_push_file_paths_excludes         = var.codepipeline_tf_tag_trigger_git_conf_push_file_paths_excludes
  trigger_git_conf_push_tags_includes               = var.codepipeline_tf_tag_trigger_git_conf_push_tags_includes
  trigger_git_conf_push_tags_excludes               = var.codepipeline_tf_tag_trigger_git_conf_push_tags_excludes
  trigger_git_conf_pull_request_events              = var.codepipeline_tf_tag_trigger_git_conf_pull_request_events
  trigger_git_conf_pull_request_branches_includes   = var.codepipeline_tf_tag_trigger_git_conf_pull_request_branches_includes
  trigger_git_conf_pull_request_branches_excludes   = var.codepipeline_tf_tag_trigger_git_conf_pull_request_branches_excludes
  trigger_git_conf_pull_request_file_paths_includes = var.codepipeline_tf_tag_trigger_git_conf_pull_request_file_paths_includes
  trigger_git_conf_pull_request_file_paths_excludes = var.codepipeline_tf_tag_trigger_git_conf_pull_request_file_paths_excludes
}