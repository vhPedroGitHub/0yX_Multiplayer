resource "aws_s3_bucket" "this" {
  count = var.cache_type == "S3" ? 1 : 0
  bucket_prefix = "${var.name}-"
  tags          = var.tags
  force_destroy = true
}

resource "aws_s3_bucket_public_access_block" "this" {
  count = var.cache_type == "S3" ? 1 : 0
  bucket = aws_s3_bucket.this[0].id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_codebuild_project" "cb_project" {
  name                   = var.name
  badge_enabled          = false
  build_timeout          = 60
  description            = var.description
  service_role           = local.service_role_arn
  queued_timeout         = 480
  concurrent_build_limit = 10

  artifacts {
    type = "CODEPIPELINE"
  }

  cache {
    type     = var.cache_type
    location = var.cache_type == "S3" ? aws_s3_bucket.this[0].bucket : null
  }

  # Environment
  environment {
    compute_type                = var.environment_compute_type
    image                       = var.environment_image
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = var.image_pull_credentials_type
    privileged_mode             = true
    # Environment variables
    dynamic "environment_variable" {
      for_each = var.environment_variables
      content {
        name  = environment_variable.value.name
        value = environment_variable.value.value
      }
    }
  }

  logs_config {

    cloudwatch_logs {
      status = "ENABLED"
    }

    # s3_logs {
    #     encryption_disabled = false 
    #     status              = "DISABLED" 
    # }
  }

  source {
    type      = "CODEPIPELINE"
    buildspec = file("${var.dir_buildspec}")
  }

  dynamic "secondary_sources" {
    for_each = length(var.secondary_sources) > 0 ? var.secondary_sources : []
    content {
      type              = secondary_sources.value.type
      source_identifier = secondary_sources.value.source_identifier
      location          = secondary_sources.value.location
    }
  }

  dynamic "secondary_source_version" {
    for_each = length(var.secondary_source_version) > 0 ? var.secondary_source_version : []
      content {
        source_identifier = secondary_source_version.value.source_identifier
        source_version    = secondary_source_version.value.source_version
      }
  }

  dynamic "vpc_config" {
    for_each = length(var.vpc_config) > 0 ? var.vpc_config : []
    content {
    vpc_id             = vpc_config.value.vpc_id
    subnets            = vpc_config.value.subnets
    security_group_ids = vpc_config.value.security_group_ids
    }
  }

  tags = var.tags

}

locals {

  service_role_arn = var.create_default_service_role ? element(aws_iam_role.service_role.*.arn, 0) : var.service_role_arn
}