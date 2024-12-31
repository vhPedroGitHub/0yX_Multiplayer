output "AMPLIFY_USERPOOL_ID" {
  value = aws_cognito_user_pool.user_pool.id
}

output "AMPLIFY_USERPOOL_CLIENT_ID" {
  value = aws_cognito_user_pool_client.client.id
} 

output "AMPLIFY_IDENTITYPOOL_ID" {
  value = aws_cognito_identity_pool.identity-pool.id
}  