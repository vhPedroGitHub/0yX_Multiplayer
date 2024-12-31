variable "alarms_statics" {
  type = list(object(
    {
    alarm_name                      = string
    alarm_description               = string
    alarm_metric_name               = string
    alarm_namespace                 = string
    
    alarm_period                    = number
    alarm_evaluation_periods        = number
    alarm_datapoints_to_alarm       = number 
    
    alarm_statistic                 = string
    alarm_threshold                 = number
    alarm_comparison_operator       = string

    alarm_insufficient_data_actions = set(string)
    alarm_actions_enabled           = bool
    alarm_actions                   = set(string)
    alarm_ok_actions                = set(string)

    alarm_InstanceId                = string
  }))
}