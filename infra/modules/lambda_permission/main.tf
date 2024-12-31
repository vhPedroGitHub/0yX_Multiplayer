# Permitir que cada alarma invoque la función Lambda
resource "aws_lambda_permission" "allow_cloudwatch_invocation" {
  statement_id     = var.statement_id
  action           = var.action
  function_name    = var.function_name
  principal        = var.principal
}