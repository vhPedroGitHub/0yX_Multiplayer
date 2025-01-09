module "lambda_alarms_bot" {
  source = "../../../modules/lambda"

  function_name         = "bot-telegram"
  handler               = "main.lambda_handler"
  lambda_path           = "../../auxiliar_files/functions/deploy_notification/"
  lambda_zip_name       = "lambda_bot_telegram.zip"
  packaging_file        = "packaging_python.sh"
  environment_variables = {
    TELEGRAM_BOT_TOKEN  = "7927833763:AAEQGYRaUJTs0iP7RAdfDXjcERS7BNmQYmc"
    TELEGRAM_CHANNEL    = "-1002399066468"
  }
  sg_ids                = [module.template.sg_db, module.template.sg_ec2]
  subnets               = module.template.private_subnets
  runtime               = "python3.10"
  source_dir            = "../../auxiliar_files/functions/deploy_notification/"
}