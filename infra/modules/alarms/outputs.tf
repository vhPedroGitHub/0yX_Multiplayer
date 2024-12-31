output "cloudwatch_alarm_arns" {
  value = [for alarm in aws_cloudwatch_metric_alarm.statics_alarm : alarm.arn]
}