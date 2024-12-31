data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

locals {
  runtime             = var.runtime
  layer_paths         = var.layer_paths
  layer_path_main     = element(var.layer_paths, 0)
  layer_zip_name      = var.layer_zip_name
  layer_name          = var.layer_name
  bucket_name         = var.bucket_name
}

data "archive_file" "this" {
  count      = length(local.layer_paths)
  type       = "zip"
  source_dir = local.layer_paths[count.index]
  output_path = ".terraform/archive_files/compare_changes_${basename(element(local.layer_paths, count.index))}.zip"
}

resource "null_resource" "lambda_layer" {
  triggers = {
    src_hashes = join(",", [for i in range(length(local.layer_paths)) : data.archive_file.this[i].output_base64sha256])
  }

  provisioner "local-exec" {
    command = <<EOT
       bash -c 'aws codeartifact login --tool dotnet --repository vision-nuget-source --domain vision --domain-owner 211125774910 --region ${data.aws_region.current.name} && \
                mkdir -p .terraform/archive_files/${local.layer_name} && \         
                dotnet store -m ${local.layer_path_main}/${local.layer_name}.csproj --skip-optimization -f net8.0 -r linux-x64 -o .terraform/archive_files/${local.layer_name}/dotnetcore/store && \
                cd .terraform/archive_files/${local.layer_name}
                cp dotnetcore/store/x64/net8.0/artifact.xml . && \
                zip ${local.layer_zip_name} -r dotnetcore/
                ' 
 EOT
}
}

resource "aws_s3_object" "lambda_layer_zip" {
  bucket      = local.bucket_name
  key         = "lambda_layers/${local.layer_name}/${local.layer_zip_name}"
  source      = coalesce(var.file_zip, ".terraform/archive_files/${local.layer_name}/${local.layer_zip_name}")
  depends_on  = [null_resource.lambda_layer]
  source_hash = var.file_zip == null ? join(",", [for i in range(length(local.layer_paths)) : data.archive_file.this[i].output_base64sha256]) : "hash_default_value"
}

resource "aws_s3_object" "lambda_layer_artifact" {
  bucket      = local.bucket_name
  key         = "lambda_layers/${local.layer_name}/artifact.xml"
  source      = coalesce(var.file_zip, ".terraform/archive_files/${local.layer_name}/artifact.xml")
  depends_on  = [null_resource.lambda_layer]
  source_hash = var.file_zip == null ? join(",", [for i in range(length(local.layer_paths)) : data.archive_file.this[i].output_base64sha256]) : "hash_default_value"
}