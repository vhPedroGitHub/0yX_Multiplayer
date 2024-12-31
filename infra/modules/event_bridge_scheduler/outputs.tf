output "id" {
  description = "Name of the schedule"
  value       = aws_scheduler_schedule.scheduler_schedule.id
}

output "arn" {
  description = "ARN of the schedule"
  value       = aws_scheduler_schedule.scheduler_schedule.arn
}

output "role_name" {
  description = "role_name"
  value       = aws_iam_role.scheduler_schedule_role.name
}