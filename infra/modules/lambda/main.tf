resource "aws_iam_role" "this" {
  name = "lambda_${var.function_name}_role"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy" "cloudwatch_access" {
  name   = "CloudWatchAccessPolicy"
  role   = aws_iam_role.this.name

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "cloudwatch:GetMetricStatistics",
          "cloudwatch:GetMetricData",
          "cloudwatch:ListMetrics"
        ],
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = aws_iam_role.this.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role_policy_attachment" "lambda_vpc_policy_attachment" {
  role       = aws_iam_role.this.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"
}

locals {
  runtime            = var.runtime
  lambda_path        = var.lambda_path
  lambda_zip_name    = var.lambda_zip_name
  lambda_name        = var.function_name
}

data "archive_file" "this" {
  type        = "zip"
  source_dir  = var.source_dir
  output_path = ".terraform/archive_files/compare_changes_${var.lambda_zip_name}"
}

resource "null_resource" "lambda" {
  triggers = {
    src_hash = "${data.archive_file.this.output_base64sha256}"
  }

  provisioner "local-exec" {
    command = "/bin/bash ${path.module}/${var.packaging_file} ${local.lambda_path} ${local.lambda_zip_name} ${local.lambda_name} ${local.runtime}"
    interpreter = ["/bin/bash", "-c"]
  }
}

resource "random_id" "bucket_suffix" {
  byte_length = 4  # Define cuántos bytes tendrá el sufijo.
}

resource "aws_s3_bucket" "lambda" {
  bucket = "${var.function_name}-${random_id.bucket_suffix.hex}"
  force_destroy = true
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.lambda.bucket

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.lambda.bucket
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_object" "lambda_zip" {
  bucket      = aws_s3_bucket.lambda.bucket
  key         = "lambda/${var.function_name}/${local.lambda_zip_name}"
  source      = ".terraform/${local.lambda_name}/${var.lambda_zip_name}"
  depends_on  = [null_resource.lambda]
  source_hash = "${data.archive_file.this.output_base64sha256}"
}

resource "aws_lambda_function" "lbdfuc" {
  function_name     = var.function_name
  handler           = var.handler
  runtime           = var.runtime
  role              = aws_iam_role.this.arn
  timeout           = var.timeout
  memory_size       = var.memory_size
  s3_bucket         = aws_s3_bucket.lambda.id
  s3_key            = aws_s3_object.lambda_zip.key
  s3_object_version = aws_s3_object.lambda_zip.version_id

  vpc_config {
    security_group_ids = var.sg_ids
    subnet_ids = var.subnets
  }

  environment {
    variables = var.environment_variables
  }
  depends_on           = [aws_s3_object.lambda_zip]
}