
data "aws_region" "current" {}

resource "aws_s3_bucket" "this" {
  bucket_prefix = "${var.name}-"
  tags          = var.tags
  force_destroy = true
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_codepipeline" "this" {
  name          = var.name
  role_arn      = aws_iam_role.pipeline.arn
  pipeline_type = "V2"

  artifact_store {
    location = aws_s3_bucket.this.bucket
    type     = "S3"
  }

  tags = var.tags

  trigger {
    provider_type = "CodeStarSourceConnection"
    git_configuration {
      source_action_name = "Source"
      push {
        branches {
          includes = var.trigger_git_conf_push_branches_includes
          excludes = var.trigger_git_conf_push_branches_excludes
        }
        file_paths {
          includes = var.trigger_git_conf_push_file_paths_includes
          excludes = var.trigger_git_conf_push_file_paths_excludes
        }
      }
      push {
        tags {
          includes = var.trigger_git_conf_push_tags_includes
          excludes = var.trigger_git_conf_push_tags_excludes
        }
      }
      pull_request {
        events = var.trigger_git_conf_pull_request_events
        branches {
          includes = var.trigger_git_conf_pull_request_branches_includes
          excludes = var.trigger_git_conf_pull_request_branches_excludes
        }
        file_paths {
          includes = var.trigger_git_conf_pull_request_file_paths_includes
          excludes = var.trigger_git_conf_pull_request_file_paths_excludes
        }
      }
    }
  }

  stage {
    name = "Source"
    action {
      name      = "Source"
      category  = "Source"
      owner     = "AWS"
      version   = "1"
      provider  = "CodeStarSourceConnection"
      namespace = "SourceVariables"
      output_artifacts = [
        "SourceOutput"
      ]
      run_order = 1
      configuration = {
        ConnectionArn        = var.codestarconnections_arn
        FullRepositoryId     = var.full_repository_id
        BranchName           = "${var.source_branch}"
        DetectChanges        = "false"
        OutputArtifactFormat = "CODE_ZIP"
      }
    }
  }

  dynamic "stage" {
    for_each = [for s in var.stages : {
      name   = s.name
      action = s.action
    } if(lookup(s, "enabled", true))]

    content {
      name = stage.value.name
      dynamic "action" {
        for_each = stage.value.action
        content {
          name             = action.value["name"]
          owner            = action.value["owner"]
          version          = action.value["version"]
          category         = action.value["category"]
          provider         = action.value["provider"]
          input_artifacts  = lookup(action.value, "input_artifacts", [])
          output_artifacts = lookup(action.value, "output_artifacts", [])
          configuration    = lookup(action.value, "configuration", {})
          role_arn         = lookup(action.value, "role_arn", null)
          run_order        = lookup(action.value, "run_order", null)
          region           = lookup(action.value, "region", data.aws_region.current.name)
        }
      }
    }
  }
}
