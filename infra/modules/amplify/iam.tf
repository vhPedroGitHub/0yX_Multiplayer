resource "aws_iam_role" "amplifyconsole_backend_role" {
  name               = "${var.name}-amplifyconsole-role"
  assume_role_policy = data.aws_iam_policy_document.amplify_assume_role_policy.json
}

resource "aws_iam_role_policy_attachment" "amplify_admin_policy" {
  role       = aws_iam_role.amplifyconsole_backend_role.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess-Amplify"
}

data "aws_iam_policy_document" "amplify_assume_role_policy" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["amplify.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}