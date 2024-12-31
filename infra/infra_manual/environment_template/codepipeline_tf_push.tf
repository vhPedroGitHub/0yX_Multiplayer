module "codepipeline_tf_push" {
  source                                            = "../../modules/codepipeline"
  count                                             = var.codepipeline_tf_push_enable_module ? 1 : 0
  name                                              = var.codepipeline_tf_push_name
  codestarconnections_arn                           = data.aws_codestarconnections_connection.connection.arn
  full_repository_id                                = var.codepipeline_tf_push_full_repository_id
  source_branch                                     = var.codepipeline_tf_push_source_branch
  tags                                              = var.codepipeline_tf_push_tags
  stages                                            = var.codepipeline_tf_push_stages
  # create_sns_notification_rule                      = var.codepipeline_tf_push_create_sns_notification_rule
  # pipeline_status_email_id                          = var.codepipeline_tf_push_pipeline_status_email_id
  # notifications_event_type_ids                      = var.codepipeline_tf_push_notifications_event_type_ids
  trigger_git_conf_push_branches_includes           = var.codepipeline_tf_push_trigger_git_conf_push_branches_includes
  trigger_git_conf_push_branches_excludes           = var.codepipeline_tf_push_trigger_git_conf_push_branches_excludes
  trigger_git_conf_push_file_paths_includes         = var.codepipeline_tf_push_trigger_git_conf_push_file_paths_includes
  trigger_git_conf_push_file_paths_excludes         = var.codepipeline_tf_push_trigger_git_conf_push_file_paths_excludes
  trigger_git_conf_push_tags_includes               = var.codepipeline_tf_push_trigger_git_conf_push_tags_includes
  trigger_git_conf_push_tags_excludes               = var.codepipeline_tf_push_trigger_git_conf_push_tags_excludes
  trigger_git_conf_pull_request_events              = var.codepipeline_tf_push_trigger_git_conf_pull_request_events
  trigger_git_conf_pull_request_branches_includes   = var.codepipeline_tf_push_trigger_git_conf_pull_request_branches_includes
  trigger_git_conf_pull_request_branches_excludes   = var.codepipeline_tf_push_trigger_git_conf_pull_request_branches_excludes
  trigger_git_conf_pull_request_file_paths_includes = var.codepipeline_tf_push_trigger_git_conf_pull_request_file_paths_includes
  trigger_git_conf_pull_request_file_paths_excludes = var.codepipeline_tf_push_trigger_git_conf_pull_request_file_paths_excludes
}