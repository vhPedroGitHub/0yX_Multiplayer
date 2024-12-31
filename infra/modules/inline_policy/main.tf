resource "aws_iam_role_policy" "inline_policy" {
  name = "${var.role_name}-inline-policy"

  role   = var.role_name
  policy = data.aws_iam_policy_document.this.json
}

data "aws_iam_policy_document" "this" {
 dynamic "statement" {
    for_each = var.statements
    content {
      actions   = statement.value.actions
      resources = statement.value.resources
      effect    = statement.value.effect
    }
 }
}