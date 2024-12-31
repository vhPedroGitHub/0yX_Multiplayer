# resource "aws_codestarnotifications_notification_rule" "pipeline_status" {

#   count = var.create_sns_notification_rule ? 1 : 0

#   name        = "pipeline-status-${var.name}"
#   detail_type = "FULL"

#   event_type_ids = var.notifications_event_type_ids

#   resource = aws_codepipeline.this.arn

#   target {
#     address = aws_sns_topic.pipeline_status[0].arn
#   }
# }

# resource "aws_sns_topic" "pipeline_status" {
#   count = var.create_sns_notification_rule ? 1 : 0

#   name = "pipeline-status-${var.name}"
# }

# resource "aws_sns_topic_subscription" "pipeline_status" {
#   count = var.create_sns_notification_rule ? 1 : 0

#   topic_arn = aws_sns_topic.pipeline_status[0].arn
#   protocol  = "email"
#   endpoint  = var.pipeline_status_email_id
# }