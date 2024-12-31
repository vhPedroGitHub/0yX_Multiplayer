output "api_gateway_rest_api_id" {
  value = aws_api_gateway_rest_api.example.id
}

output "api_gateway_rest_api_root_resource_id" {
  value = aws_api_gateway_rest_api.example.root_resource_id
}

output "api_gateway_resource_id" {
  value = aws_api_gateway_resource.example_resource.id
}

output "api_gateway_method_http_method" {
  value = aws_api_gateway_method.example_method.http_method
}

output "api_gateway_deployment_stage_name" {
  value = aws_api_gateway_deployment.example_deployment.stage_name
}
