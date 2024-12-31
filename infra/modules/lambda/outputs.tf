output "lambda_function_arn" {
  value = aws_lambda_function.lbdfuc.arn
}

output "lambda_function_invoke_arn" {
  value = aws_lambda_function.lbdfuc.invoke_arn
}

output "lambda_function_name" {
  value = aws_lambda_function.lbdfuc.function_name
}

output "lambda_function_role_name" {
  value = aws_iam_role.this.name
}

output "lambda_function_s3_object_version" {
  value = aws_lambda_function.lbdfuc.s3_object_version
}