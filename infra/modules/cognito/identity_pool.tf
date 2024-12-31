resource "aws_cognito_identity_pool" "identity-pool" {
  identity_pool_name               = "test-identity-pool"
  allow_unauthenticated_identities = false
  allow_classic_flow               = false

 cognito_identity_providers {
    client_id               = aws_cognito_user_pool_client.client.id
    provider_name           = "cognito-idp.us-east-1.amazonaws.com/${aws_cognito_user_pool.user_pool.id}"
    server_side_token_check = false
  }

}


#----------------------------------
#
# Including user access on Identity Pool
#
#-----------------------------------

data "aws_iam_policy_document" "authenticated" {
  statement {
    effect = "Allow"

    principals {
      type        = "Federated"
      identifiers = ["cognito-identity.amazonaws.com"]
    }

    actions = ["sts:AssumeRoleWithWebIdentity"]

    condition {
      test     = "StringEquals"
      variable = "cognito-identity.amazonaws.com:aud"
      values   = [aws_cognito_identity_pool.identity-pool.id]
    }

    condition {
      test     = "ForAnyValue:StringLike"
      variable = "cognito-identity.amazonaws.com:amr"
      values   = ["authenticated"]
    }
  }
}

resource "aws_iam_role" "authenticated" {
  name               = "cognito_authenticated"
  assume_role_policy = data.aws_iam_policy_document.authenticated.json
}

data "aws_iam_policy_document" "authenticated_role_policy" {
  statement {
    effect = "Allow"

    actions = [
      "mobileanalytics:PutEvents",
      "cognito-sync:*",
      "cognito-identity:*",
    ]

    resources = ["*"]
  }
}

resource "aws_iam_role_policy" "authenticated" {
  name   = "authenticated_policy"
  role   = aws_iam_role.authenticated.id
  policy = data.aws_iam_policy_document.authenticated_role_policy.json
}

resource "aws_cognito_identity_pool_roles_attachment" "main" {
      identity_pool_id = aws_cognito_identity_pool.identity-pool.id

      roles = {
           authenticated   = aws_iam_role.authenticated.arn
           unauthenticated = aws_iam_role.unauthenticated.arn
      }
 }

#-------------------------------------------------------
#
#  Unauthenticated Role Definition
#
#-------------------------------------------------------

data "aws_iam_policy_document" "unauthenticated" {
  statement {
    effect = "Allow"

    principals {
      type        = "Federated"
      identifiers = ["cognito-identity.amazonaws.com"]
    }

    actions = ["sts:AssumeRoleWithWebIdentity"]

    condition {
      test     = "StringEquals"
      variable = "cognito-identity.amazonaws.com:aud"
      values   = [aws_cognito_identity_pool.identity-pool.id]
    }

    condition {
      test     = "ForAnyValue:StringLike"
      variable = "cognito-identity.amazonaws.com:amr"
      values   = ["unauthenticated"]
    }
  }
}

resource "aws_iam_role" "unauthenticated" {
  name               = "cognito_unauthenticated"
  assume_role_policy = data.aws_iam_policy_document.unauthenticated.json
}

data "aws_iam_policy_document" "unauthenticated_role_policy" {
  statement {
    effect = "Deny"
    actions = [ "*"]
    resources = ["*"]
  }
}

resource "aws_iam_role_policy" "unauthenticated" {
  name   = "unauthenticated_policy"
  role   = aws_iam_role.unauthenticated.id
  policy = data.aws_iam_policy_document.unauthenticated_role_policy.json
}