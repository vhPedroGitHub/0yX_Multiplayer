# resource "aws_amplify_domain_association" "this" {
#   app_id                = aws_amplify_app.amplify_app.id
#   domain_name           = var.domain_name
#   wait_for_verification = false

#   sub_domain {
#     branch_name = aws_amplify_branch.amplify_branch.branch_name
#     prefix      = ""
#   }

#   sub_domain {
#     branch_name = aws_amplify_branch.amplify_branch.branch_name
#     prefix      = "www"
#   }
# }