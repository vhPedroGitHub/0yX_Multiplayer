# resource "aws_amplify_branch" "amplify_branch" {
#   app_id            = aws_amplify_app.amplify_app.id
#   branch_name       = var.branch_name
#   enable_auto_build = var.enable_auto_build
# }