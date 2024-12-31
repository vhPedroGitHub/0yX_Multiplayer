module "s3_bucket_lambdas" {
  source        = "../../../modules/s3_bucket"
  bucket_prefix = "lambdas-zip"
  force_destroy = false
}