# resource "aws_amplify_backend_environment" "amplify_backend_env" {
#   app_id           = aws_amplify_app.amplify_app.id
#   environment_name = var.backend_env_name
# #   deployment_artifacts = "app-example-deployment"
#   stack_name           = "amplify-app-${var.name}"
# }