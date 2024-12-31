output "amplify_default_domain" {
  value = aws_amplify_app.amplify_app.default_domain
}

output "amplify_app_id" {
  value = aws_amplify_app.amplify_app.id
}

# output "amplify_branch_name" {
#   value = aws_amplify_branch.amplify_branch.branch_name
# }

output "basic_auth_credentials" {
  value = aws_amplify_app.amplify_app.basic_auth_credentials
}