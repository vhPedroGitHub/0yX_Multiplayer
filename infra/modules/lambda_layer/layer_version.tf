resource "aws_lambda_layer_version" "lambda_layer" {
  layer_name          = local.layer_name
  description         = "{\"Nlt\":1,\"Dir\":\"dotnetcore/store\",\"Op\":0,\"Buc\":\"${local.bucket_name}\",\"Key\":\"${local.layer_name}/artifact.xml\"}"
  compatible_runtimes = var.compatible_runtimes
  s3_bucket           = local.bucket_name
  s3_key              = aws_s3_object.lambda_layer_zip.key
  s3_object_version   = aws_s3_object.lambda_layer_zip.version_id
  skip_destroy        = var.skip_destroy
  depends_on          = [aws_s3_object.lambda_layer_zip]
}