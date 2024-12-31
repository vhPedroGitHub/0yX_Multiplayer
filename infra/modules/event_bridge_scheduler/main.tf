resource "aws_scheduler_schedule" "scheduler_schedule" {
  state      = var.state
  name       = var.name
  group_name = var.group_name

  flexible_time_window {
    mode                      = var.flexible_time_window_mode
    maximum_window_in_minutes = var.maximum_window_in_minutes
  }
  schedule_expression_timezone = var.schedule_expression_timezone
  schedule_expression = var.schedule_expression
  # schedule_expression = "cron(15 10 * * ? *)"
  # schedule_expression = "rate(1 hours)"

  target {
    arn      = var.target_arn
    role_arn = aws_iam_role.scheduler_schedule_role.arn
  }
}


resource "aws_iam_role" "scheduler_schedule_role" {
  name               = "${var.name}-scheduler-schedule-role"
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "scheduler.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
EOF
}