variable "region" {
  description = "region"
  type        = string
  default     = "us-east-1"
}
variable "codestarconnections_name" {
  description = "codestarconnections_name"
  type        = string
  default     = "codepipeline-tf"
}

variable "codepipeline_tf_push_enable_module" {
  description = "Habilita o deshabilita el módulo"
  type        = bool
  default     = true
}
# Codepipeline
variable "codepipeline_tf_push_name" {
  description = "codepipeline_name"
  type        = string
}
variable "codepipeline_tf_push_full_repository_id" {
  description = "codepipeline_full_repository_id"
  type        = string
}
variable "codepipeline_tf_push_source_branch" {
  description = "codepipeline_source_branch"
  type        = string
}
variable "codepipeline_tf_push_tags" {
  description = "tags_codepipeline"
  type        = map(string)
  default     = {}
}
variable "codepipeline_tf_push_stages" {
  type = list(object({
    name = string
    action = list(object({
      name             = string
      category         = string
      owner            = string
      provider         = string
      input_artifacts  = list(string)
      output_artifacts = list(string)
      version          = string
      run_order        = number
      configuration    = map(string)
    }))
  }))
  description = "This list describes each stage of the build"
}
# variable "codepipeline_tf_push_create_sns_notification_rule" {
#   description = "Create rule for pipeline status notifications using SNS"
#   type        = bool
#   default     = true
# }
# variable "codepipeline_tf_push_pipeline_status_email_id" {
#   description = "Eamil id for pipeline status notifications"
#   type        = string
#   default     = null
# }
# variable "codepipeline_tf_push_notifications_event_type_ids" {
#   description = "codepipeline_notifications_event_type_ids"
#   type        = list(any)
# }
#####trigger#########33
variable "codepipeline_tf_push_trigger_git_conf_source_action_name" {
  description = "trigger_git_configuration_source_action_name"
  type        = string
  default     = "Source"
}
variable "codepipeline_tf_push_trigger_git_conf_push_branches_includes" {
  description = "trigger_git_conf_push_branches_includes"
  type        = list(any)
  default     = []
}
variable "codepipeline_tf_push_trigger_git_conf_push_branches_excludes" {
  description = "trigger_git_conf_push_branches_excludes"
  type        = list(any)
  default     = null
}
variable "codepipeline_tf_push_trigger_git_conf_push_file_paths_includes" {
  description = "trigger_git_conf_push_file_paths_includes"
  type        = list(any)
  default     = []
}
variable "codepipeline_tf_push_trigger_git_conf_push_file_paths_excludes" {
  description = "trigger_git_conf_push_file_paths_excludes"
  type        = list(any)
  default     = null
}
variable "codepipeline_tf_push_trigger_git_conf_push_tags_includes" {
  description = "trigger_git_conf_push_tags_includes"
  type        = list(any)
  default     = null
}
variable "codepipeline_tf_push_trigger_git_conf_push_tags_excludes" {
  description = "trigger_git_conf_push_tags_excludes"
  type        = list(any)
  default     = null
}
variable "codepipeline_tf_push_trigger_git_conf_pull_request_events" {
  description = "trigger_git_conf_pull_request_events"
  type        = list(any)
  default     = ["OPEN", "UPDATED", "CLOSED"]
}
variable "codepipeline_tf_push_trigger_git_conf_pull_request_branches_includes" {
  description = "trigger_git_conf_pull_request_branches_includes"
  type        = list(any)
  default     = null
}
variable "codepipeline_tf_push_trigger_git_conf_pull_request_branches_excludes" {
  description = "trigger_git_conf_pull_request_branches_excludes"
  type        = list(any)
  default     = null
}
variable "codepipeline_tf_push_trigger_git_conf_pull_request_file_paths_includes" {
  description = "trigger_git_conf_pull_request_file_paths_includes"
  type        = list(any)
  default     = [".*"]
}
variable "codepipeline_tf_push_trigger_git_conf_pull_request_file_paths_excludes" {
  description = "trigger_git_conf_pull_request_file_paths_excludes"
  type        = list(any)
  default     = null
}


################___   ___
################l__l  l__l
################l     l   l

variable "codepipeline_tf_pr_enable_module" {
  description = "Habilita o deshabilita el módulo"
  type        = bool
  default     = true
}
# Codepipeline
variable "codepipeline_tf_pr_name" {
  description = "codepipeline_name"
  type        = string
}
variable "codepipeline_tf_pr_full_repository_id" {
  description = "codepipeline_full_repository_id"
  type        = string
}
variable "codepipeline_tf_pr_source_branch" {
  description = "codepipeline_source_branch"
  type        = string
}
variable "codepipeline_tf_pr_tags" {
  description = "tags_codepipeline"
  type        = map(string)
  default     = {}
}
variable "codepipeline_tf_pr_stages" {
  type = list(object({
    name = string
    action = list(object({
      name             = string
      category         = string
      owner            = string
      provider         = string
      input_artifacts  = list(string)
      output_artifacts = list(string)
      version          = string
      run_order        = number
      configuration    = map(string)
    }))
  }))
  description = "This list describes each stage of the build"
}
#####trigger#########33
variable "codepipeline_tf_pr_trigger_git_conf_source_action_name" {
  description = "trigger_git_configuration_source_action_name"
  type        = string
  default     = "Source"
}
variable "codepipeline_tf_pr_trigger_git_conf_push_branches_includes" {
  description = "trigger_git_conf_push_branches_includes"
  type        = list(any)
  default     = []
}
variable "codepipeline_tf_pr_trigger_git_conf_push_branches_excludes" {
  description = "trigger_git_conf_push_branches_excludes"
  type        = list(any)
  default     = null
}
variable "codepipeline_tf_pr_trigger_git_conf_push_file_paths_includes" {
  description = "trigger_git_conf_push_file_paths_includes"
  type        = list(any)
  default     = []
}
variable "codepipeline_tf_pr_trigger_git_conf_push_file_paths_excludes" {
  description = "trigger_git_conf_push_file_paths_excludes"
  type        = list(any)
  default     = null
}
variable "codepipeline_tf_pr_trigger_git_conf_push_tags_includes" {
  description = "trigger_git_conf_push_tags_includes"
  type        = list(any)
  default     = null
}
variable "codepipeline_tf_pr_trigger_git_conf_push_tags_excludes" {
  description = "trigger_git_conf_push_tags_excludes"
  type        = list(any)
  default     = null
}
variable "codepipeline_tf_pr_trigger_git_conf_pull_request_events" {
  description = "trigger_git_conf_pull_request_events"
  type        = list(any)
  default     = ["OPEN", "UPDATED", "CLOSED"]
}
variable "codepipeline_tf_pr_trigger_git_conf_pull_request_branches_includes" {
  description = "trigger_git_conf_pull_request_branches_includes"
  type        = list(any)
  default     = null
}
variable "codepipeline_tf_pr_trigger_git_conf_pull_request_branches_excludes" {
  description = "trigger_git_conf_pull_request_branches_excludes"
  type        = list(any)
  default     = null
}
variable "codepipeline_tf_pr_trigger_git_conf_pull_request_file_paths_includes" {
  description = "trigger_git_conf_pull_request_file_paths_includes"
  type        = list(any)
  default     = [".*"]
}
variable "codepipeline_tf_pr_trigger_git_conf_pull_request_file_paths_excludes" {
  description = "trigger_git_conf_pull_request_file_paths_excludes"
  type        = list(any)
  default     = null
}

################_____       __
################  l   __   l__
################  l  l__l_ l__l

variable "codepipeline_tf_tag_enable_module" {
  description = "Habilita o deshabilita el módulo"
  type        = bool
  default     = true
}
# Codepipeline
variable "codepipeline_tf_tag_name" {
  description = "codepipeline_name"
  type        = string
}
variable "codepipeline_tf_tag_full_repository_id" {
  description = "codepipeline_full_repository_id"
  type        = string
}
variable "codepipeline_tf_tag_source_branch" {
  description = "codepipeline_source_branch"
  type        = string
}
variable "codepipeline_tf_tag_tags" {
  description = "tags_codepipeline"
  type        = map(string)
  default     = {}
}
variable "codepipeline_tf_tag_stages" {
  type = list(object({
    name = string
    action = list(object({
      name             = string
      category         = string
      owner            = string
      provider         = string
      input_artifacts  = list(string)
      output_artifacts = list(string)
      version          = string
      run_order        = number
      configuration    = map(string)
    }))
  }))
  description = "This list describes each stage of the build"
}
#####trigger#########33
variable "codepipeline_tf_tag_trigger_git_conf_source_action_name" {
  description = "trigger_git_configuration_source_action_name"
  type        = string
  default     = "Source"
}
variable "codepipeline_tf_tag_trigger_git_conf_push_branches_includes" {
  description = "trigger_git_conf_push_branches_includes"
  type        = list(any)
  default     = []
}
variable "codepipeline_tf_tag_trigger_git_conf_push_branches_excludes" {
  description = "trigger_git_conf_push_branches_excludes"
  type        = list(any)
  default     = null
}
variable "codepipeline_tf_tag_trigger_git_conf_push_file_paths_includes" {
  description = "trigger_git_conf_push_file_paths_includes"
  type        = list(any)
  default     = []
}
variable "codepipeline_tf_tag_trigger_git_conf_push_file_paths_excludes" {
  description = "trigger_git_conf_push_file_paths_excludes"
  type        = list(any)
  default     = null
}
variable "codepipeline_tf_tag_trigger_git_conf_push_tags_includes" {
  description = "trigger_git_conf_push_tags_includes"
  type        = list(any)
  default     = null
}
variable "codepipeline_tf_tag_trigger_git_conf_push_tags_excludes" {
  description = "trigger_git_conf_push_tags_excludes"
  type        = list(any)
  default     = null
}
variable "codepipeline_tf_tag_trigger_git_conf_pull_request_events" {
  description = "trigger_git_conf_pull_request_events"
  type        = list(any)
  default     = ["OPEN", "UPDATED", "CLOSED"]
}
variable "codepipeline_tf_tag_trigger_git_conf_pull_request_branches_includes" {
  description = "trigger_git_conf_pull_request_branches_includes"
  type        = list(any)
  default     = null
}
variable "codepipeline_tf_tag_trigger_git_conf_pull_request_branches_excludes" {
  description = "trigger_git_conf_pull_request_branches_excludes"
  type        = list(any)
  default     = null
}
variable "codepipeline_tf_tag_trigger_git_conf_pull_request_file_paths_includes" {
  description = "trigger_git_conf_pull_request_file_paths_includes"
  type        = list(any)
  default     = [".*"]
}
variable "codepipeline_tf_tag_trigger_git_conf_pull_request_file_paths_excludes" {
  description = "trigger_git_conf_pull_request_file_paths_excludes"
  type        = list(any)
  default     = null
}