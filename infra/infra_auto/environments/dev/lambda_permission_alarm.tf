module "lambda_permission_alarm" {
    source        = "../../../modules/lambda_permission"
    statement_id  = "AllowCloudWatchToInvokeLambda"
    action        = "lambda:InvokeFunction"
    function_name =  module.lambda_alarms_bot.lambda_function_name
    principal     = "lambda.alarms.cloudwatch.amazonaws.com"
}
