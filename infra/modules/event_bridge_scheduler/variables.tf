variable "name" {
  description = "Forces new resource) Name of the schedule. If omitted, Terraform will assign a random, unique name. Conflicts with name_prefix"
  type        = string
}

variable "group_name" {
  description = "(Forces new resource) Name of the schedule group to associate with this schedule. When omitted, the default schedule group is used"
  type        = string
  default     = "default"
}

variable flexible_time_window_mode {
    description = "Determines whether the schedule is invoked within a flexible time window. One of: OFF, FLEXIBLE"
    type        = string
    default     = "OFF"
}
variable maximum_window_in_minutes {
    description = "Maximum time window during which a schedule can be invoked. Ranges from 1 to 1440 minutes"
    type        = number
    default     = null
}
variable schedule_expression_timezone {
    description = "Timezone in which the scheduling expression is evaluated. Defaults to UTC. Example: Australia/Sydney"
    type        = string
    default = "UTC"
}
variable schedule_expression {
    description = "Defines when the schedule runs. Read more in https://docs.aws.amazon.com/scheduler/latest/UserGuide/schedule-types.html"
    type        = string
}

variable state {
    description = "Specifies whether the schedule is enabled or disabled. One of: ENABLED (default), DISABLED"
    type        = string
    default     = "ENABLED"
}

variable target_arn {
    description = "ARN of the target of this schedule, such as a SQS queue or ECS cluster. For universal targets, this is a Service ARN specific to the target service"
    type        = string
}