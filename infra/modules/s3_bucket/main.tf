resource "aws_s3_bucket" "this" {
  bucket_prefix = "${var.bucket_prefix}-"
  bucket        = var.bucket_prefix == null ? var.bucket : null
  tags          = var.tags
  force_destroy = var.force_destroy
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.this.id
  versioning_configuration {
    status = var.versioning_status
  }
}