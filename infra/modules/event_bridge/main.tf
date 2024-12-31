# module "lambda_permission_deploy_notifications" {
#   source                           = "../../modules/lambda_permission"
#   statement_id                     = "AllowExecutionFromEventBridge"
#   integration_lambda_function_name = module.lambda_deploy_notifications.lambda_function_name
#   principal                        = "events.amazonaws.com"
#   source_arn                       = "${aws_cloudwatch_event_rule.lambda_cicd_notification.arn}"
# }

resource "aws_cloudwatch_event_rule" "this" {
    state          = var.state 
    name           = var.name
    event_bus_name = var.event_bus_name
    event_pattern  = jsonencode(var.event_pattern)
}

resource "aws_cloudwatch_event_target" "this" {
    rule      = aws_cloudwatch_event_rule.this.name
    arn       = var.event_target_arn
    role_arn  = var.role_arn
}