# create the alarms from here 
# https://docs.aws.amazon.com/es_es/AmazonCloudWatch/latest/monitoring/Best_Practice_Recommended_Alarms_AWS_Services.html#RDS

module "rds_alarms_statics" {
  source = "../../../modules/alarms"
  
  alarms_statics = [
    #-----------------
    # CPUUtilization |
    #-----------------
    {
      alarm_name                = "CPUUtilization_RDS"
      alarm_description         = <<-EOF
                                  "This alarm is used to detect a constant high CPU usage in order to avoid
                                  very high response times and timeouts. If you want to check the CPU usage 
                                  microburst, you can set a lower alarm evaluation time."
                                EOF

      alarm_metric_name               = "CPUUtilization"
      alarm_namespace                 = "AWS/RDS"
    
      alarm_period                    = 60
      alarm_evaluation_periods        = 1
      alarm_datapoints_to_alarm       = 1
    
      alarm_statistic                 = "Average"
      alarm_threshold                 = 90
      alarm_comparison_operator       = "GreaterThanThreshold"

      alarm_insufficient_data_actions = []
      alarm_actions_enabled           = true
      alarm_actions                   = [module.lambda_alarms_bot.lambda_function_arn]
      alarm_ok_actions                = [module.lambda_alarms_bot.lambda_function_arn]

      alarm_InstanceId                = module.template.identifier
    },

    #----------------------
    # DatabaseConnections |
    #----------------------
    {
      alarm_name                = "DatabaseConnections_RDS"
      alarm_description         = <<-EOF
                                  This alarm is used to prevent connection rejection when the maximum number 
                                  of database connections is reached. This alarm is not recommended if you 
                                  frequently change the database instance class, as doing so changes the memory 
                                  and the default maximum number of connections.
                                EOF

      alarm_metric_name               = "DatabaseConnections"
      alarm_namespace                 = "AWS/RDS"
    
      alarm_period                    = 60
      alarm_evaluation_periods        = 1
      alarm_datapoints_to_alarm       = 1
    
      alarm_statistic                 = "Average"
      alarm_threshold                 = 5
      alarm_comparison_operator       = "GreaterThanThreshold"

      alarm_insufficient_data_actions = []
      alarm_actions_enabled           = true
      alarm_actions                   = [module.lambda_alarms_bot.lambda_function_arn]
      alarm_ok_actions                = [module.lambda_alarms_bot.lambda_function_arn]

      alarm_InstanceId                = module.template.identifier
    },

    #------------------
    # EBSByteBalance% |
    #------------------
    {
      alarm_name                = "EBSByteBalance%_RDS"
      alarm_description         = <<-EOF
                                  This alarm is used to detect a low percentage of performance credits 
                                  remaining in the burst bucket. A low byte balance percentage can cause
                                  performance bottleneck problems. This alarm is not recommended for Aurora 
                                  PostgreSQL instances.
                                EOF

      alarm_metric_name               = "EBSByteBalance%"
      alarm_namespace                 = "AWS/RDS"
    
      alarm_period                    = 60
      alarm_evaluation_periods        = 1
      alarm_datapoints_to_alarm       = 1
    
      alarm_statistic                 = "Average"
      alarm_threshold                 = 10.0
      alarm_comparison_operator       = "LessThanThreshold"

      alarm_insufficient_data_actions = []
      alarm_actions_enabled           = true
      alarm_actions                   = [module.lambda_alarms_bot.lambda_function_arn]
      alarm_ok_actions                = [module.lambda_alarms_bot.lambda_function_arn]

      alarm_InstanceId                = module.template.identifier
    }
  ]

  depends_on = [ module.lambda_alarms_bot ]
}