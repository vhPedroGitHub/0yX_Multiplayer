variable "name" {
  description = "The name of the rule. If omitted, Terraform will assign a random, unique name. Conflicts with name_prefix"
  type        = string
}

variable "event_pattern" {
  description = "The event pattern described a JSON object. At least one of schedule_expression or event_pattern is required. See full documentation of Events and Event Patterns in EventBridge for details. Note: The event pattern size is 2048 by default but it is adjustable up to 4096 characters by submitting a service quota increase request. See Amazon EventBridge quotas for details"
  type        = map(any)
}

variable "event_bus_name" {
  description = "The name or ARN of the event bus to associate with this rule. If you omit this, the default event bus is used"
  type        = string
  default     = "default"
}

variable state {
    description = " State of the rule. Valid values are DISABLED, ENABLED, and ENABLED_WITH_ALL_CLOUDTRAIL_MANAGEMENT_EVENTS. When state is ENABLED, the rule is enabled for all events except those delivered by CloudTrail. To also enable the rule for events delivered by CloudTrail, set state to ENABLED_WITH_ALL_CLOUDTRAIL_MANAGEMENT_EVENTS. Defaults to ENABLED. Conflicts with is_enabled"
    type        = string
    default     = "ENABLED"
}

variable event_target_arn {
    description = "The Amazon Resource Name (ARN) of the target"
    type        = string
    default     = null
}
variable role_arn {
    description = "The Amazon Resource Name (ARN) associated with the role that is used for target invocation"
    type        = string
    default     = null
}