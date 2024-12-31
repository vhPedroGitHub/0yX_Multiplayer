output "lambda_permission_id" {
  description = "The ID of the Lambda permission"
  value       = aws_lambda_permission.allow_cloudwatch_invocation.id
}

output "lambda_permission_statement_id" {
  description = "The statement ID of the Lambda permission"
  value       = aws_lambda_permission.allow_cloudwatch_invocation.statement_id
}

output "lambda_permission_function_name" {
  description = "The name of the Lambda function"
  value       = aws_lambda_permission.allow_cloudwatch_invocation.function_name
}