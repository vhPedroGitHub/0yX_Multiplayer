resource "aws_amplify_app" "amplify_app" {
  name                   = var.name
  description            = var.description
  repository             = var.repository
  platform               = var.platform
  access_token           = var.access_token
  enable_basic_auth      = var.enable_basic_auth
  basic_auth_credentials = var.enable_basic_auth ? var.basic_auth_credentials : null
  oauth_token            = var.oauth_token
  iam_service_role_arn   = aws_iam_role.amplifyconsole_backend_role.arn

  environment_variables = var.environment_variables

  build_spec = file(var.build_spec)

  # The default rewrites and redirects added by the Amplify Console.
  dynamic "custom_rule" {
    for_each = var.custom_rule
    content {
      source = custom_rule.value.source
      status = custom_rule.value.status
      target = custom_rule.value.target
    }
  }

  # custom_headers = file(var.custom_headers)
  custom_headers = file("${var.dir_customhttp}")

  # lifecycle {
  #   ignore_changes = [
  #     oauth_token,
  #   ]
  # }

}

resource "aws_amplify_branch" "branch" {
  count = length(var.branch_names) > 0 ? length(var.branch_names) : 0

  app_id                  = aws_amplify_app.amplify_app.id
  branch_name             = var.branch_names[count.index]
  enable_auto_build       = var.enable_auto_build
  # backend_environment_arn = aws_amplify_backend_environment.this.arn
}

resource "aws_amplify_domain_association" "domain" {
  count = length(var.domain_names) > 0 ? length(var.domain_names) : 0

  app_id                = aws_amplify_app.amplify_app.id
  domain_name           = var.domain_names[count.index]
  wait_for_verification = false

  dynamic "sub_domain" {
    for_each = ["", "www"]
    content {
      branch_name = aws_amplify_branch.branch[count.index].branch_name
      prefix      = sub_domain.value
    }
  }
}