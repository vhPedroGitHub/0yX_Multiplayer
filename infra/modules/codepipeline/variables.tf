variable "name" {
  type        = string
  description = "(Required) Name os resources"
}
variable "codestarconnections_arn" {
  type        = string
  description = "codestarconnections_name"
}
variable "full_repository_id" {
  type        = string
  description = "full_repository_id"
}
variable "source_branch" {
  type        = string
  description = "source_branch"
}
variable "tags" {
  type        = map(any)
  description = "(Optional) Implements the common tags scheme"
  default     = {}
}

variable "stages" {
  type = list(object({
    name   = string
    action = list(any)
  }))
  description = "This list describes each stage of the build"
}

# variable "create_sns_notification_rule" {
#   description = "Create rule for pipeline status notifications using SNS"
#   type        = bool
#   default     = false
# }
# variable "pipeline_status_email_id" {
#   description = "Eamil id for pipeline status notifications"
#   type        = string
#   default     = null
# }
# variable "notifications_event_type_ids" {
#   description = "event_type_ids"
#   type        = list(any)
#   default     = []
# }

variable "trigger_git_conf_source_action_name" {
  description = "trigger_git_configuration_source_action_name"
  type        = string
  default     = "Source"
}
variable "trigger_git_conf_push_branches_includes" {
  description = "trigger_git_conf_push_branches_includes"
  type        = list(any)
  default     = []
}
variable "trigger_git_conf_push_branches_excludes" {
  description = "trigger_git_conf_push_branches_excludes"
  type        = list(any)
  default     = null
}
variable "trigger_git_conf_push_file_paths_includes" {
  description = "trigger_git_conf_push_file_paths_includes"
  type        = list(any)
  default     = []
}
variable "trigger_git_conf_push_file_paths_excludes" {
  description = "trigger_git_conf_push_file_paths_excludes"
  type        = list(any)
  default     = null
}
variable "trigger_git_conf_push_tags_includes" {
  description = "trigger_git_conf_push_tags_includes"
  type        = list(any)
  default     = null
}
variable "trigger_git_conf_push_tags_excludes" {
  description = "trigger_git_conf_push_tags_excludes"
  type        = list(any)
  default     = null
}
variable "trigger_git_conf_pull_request_events" {
  description = "trigger_git_conf_pull_request_events"
  type        = list(any)
  default     = ["OPEN", "UPDATED", "CLOSED"]
}
variable "trigger_git_conf_pull_request_branches_includes" {
  description = "trigger_git_conf_pull_request_branches_includes"
  type        = list(any)
  default     = null
}
variable "trigger_git_conf_pull_request_branches_excludes" {
  description = "trigger_git_conf_pull_request_branches_excludes"
  type        = list(any)
  default     = null
}
variable "trigger_git_conf_pull_request_file_paths_includes" {
  description = "trigger_git_conf_pull_request_file_paths_includes"
  type        = list(any)
  default     = [".*"]
}
variable "trigger_git_conf_pull_request_file_paths_excludes" {
  description = "trigger_git_conf_pull_request_file_paths_excludes"
  type        = list(any)
  default     = null
}