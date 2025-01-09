module "bucket_project" {
    source = "../../../modules/s3_bucket"

    bucket_prefix = "project-bucket-prefix"
}