resource "aws_api_gateway_rest_api" "custom_gtw" {
    name        = var.api_gtw_rest_name
    description = var.api_gtw_rest_description
}

resource "aws_api_gateway_resource" "custom_gtw_resource" {
    rest_api_id = aws_api_gateway_rest_api.custom_gtw.id
    parent_id   = aws_api_gateway_rest_api.custom_gtw.root_resource_id
    path_part   = var.api_gtw_rest_path_part
}

resource "aws_api_gateway_method" "custom_gtw_method" {
    rest_api_id   = aws_api_gateway_rest_api.custom_gtw.id
    resource_id   = aws_api_gateway_resource.custom_gtw_resource.id
    http_method   = var.api_gtw_rest_http_method
    authorization = var.api_gtw_rest_authorization
}

resource "aws_api_gateway_integration" "custom_gtw_integration" {
    rest_api_id             = aws_api_gateway_rest_api.custom_gtw.id
    resource_id             = aws_api_gateway_resource.custom_gtw_resource.id
    http_method             = aws_api_gateway_method.custom_gtw_method.http_method
    type                    = var.api_gtw_rest_integration_type
    integration_http_method = var.api_gtw_rest_integration_http_method
    uri                     = var.api_gtw_rest_uri
}

resource "aws_api_gateway_deployment" "custom_gtw_deployment" {
    depends_on              = [aws_api_gateway_integration.custom_gtw_integration]
    rest_api_id             = aws_api_gateway_rest_api.custom_gtw.id
    stage_name              = var.api_gtw_rest_stage_name
}