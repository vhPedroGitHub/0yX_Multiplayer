# -------------------
# Cloudwatch Alarms |
# -------------------

# ---------------------------
# Cloudwatch Alarms Statics |
# ---------------------------
resource "aws_cloudwatch_metric_alarm" "statics_alarm" {
  for_each = {for alarm in var.alarms_statics : alarm.alarm_name => alarm }

  alarm_name                = each.value.alarm_name
  alarm_description         = each.value.alarm_description
  metric_name               = each.value.alarm_metric_name
  namespace                 = each.value.alarm_namespace
  
  period                    = each.value.alarm_period
  evaluation_periods        = each.value.alarm_evaluation_periods
  datapoints_to_alarm       = each.value.alarm_datapoints_to_alarm
  
  statistic                 = each.value.alarm_statistic
  threshold                 = each.value.alarm_threshold
  comparison_operator       = each.value.alarm_comparison_operator

  insufficient_data_actions = each.value.alarm_insufficient_data_actions
  actions_enabled           = each.value.alarm_actions_enabled
  alarm_actions             = each.value.alarm_actions
  ok_actions                = each.value.alarm_ok_actions

  dimensions = {
    DBInstanceIdentifier = each.value.alarm_InstanceId
  }
}

# ----------------------------------
# Cloudwatch Alarms Metrics Querys |
# ----------------------------------
# resource "aws_cloudwatch_metric_alarm" "foobar" {
#   alarm_name                = "terraform-test-foobar"
#   comparison_operator       = "GreaterThanOrEqualToThreshold"
#   evaluation_periods        = 2
#   threshold                 = 10
#   alarm_description         = "Request error rate has exceeded 10%"
#   insufficient_data_actions = []

#   metric_query {
#     id          = "e1"
#     expression  = "m2/m1*100"
#     label       = "Error Rate"
#     return_data = "true"
#   }

#   metric_query {
#     id = "m1"

#     metric {
#       metric_name = "RequestCount"
#       namespace   = "AWS/ApplicationELB"
#       period      = 120
#       stat        = "Sum"
#       unit        = "Count"

#       dimensions = {
#         LoadBalancer = "app/web"
#       }
#     }
#   }

#   metric_query {
#     id = "m2"

#     metric {
#       metric_name = "HTTPCode_ELB_5XX_Count"
#       namespace   = "AWS/ApplicationELB"
#       period      = 120
#       stat        = "Sum"
#       unit        = "Count"

#       dimensions = {
#         LoadBalancer = "app/web"
#       }
#     }
#   }
# }

# -----------------------------------
# Cloudwatch Alarms Metrics Anomaly |
# -----------------------------------
# resource "aws_cloudwatch_metric_alarm" "xx_anomaly_detection" {
#   alarm_name                = "terraform-test-foobar"
#   comparison_operator       = "GreaterThanUpperThreshold"
#   evaluation_periods        = 2
#   threshold_metric_id       = "e1"
#   alarm_description         = "This metric monitors ec2 cpu utilization"
#   insufficient_data_actions = []

#   metric_query {
#     id          = "e1"
#     expression  = "ANOMALY_DETECTION_BAND(m1)"
#     label       = "CPUUtilization (Expected)"
#     return_data = "true"
#   }

#   metric_query {
#     id          = "m1"
#     return_data = "true"
#     metric {
#       metric_name = "CPUUtilization"
#       namespace   = "AWS/EC2"
#       period      = 120
#       stat        = "Average"
#       unit        = "Count"

#       dimensions = {
#         InstanceId = "i-abc123"
#       }
#     }
#   }
# }