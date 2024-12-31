# data "aws_ami" "latest_ami" {
#   most_recent = true

#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-${var.ubuntu_codename}-${var.ubuntu_version}-*"]
#   }
# }


#  locals {
#     iam_instance_profile_commented = var.iam_instance_profile != "" ? var.iam_instance_profile : "# iam_instance_profile = "
#   }

resource "aws_instance" "server" {
  # ami                       = coalesce(var.ami_specific_id, data.aws_ami.latest_ami.id)
  ami                         = var.ami_specific_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.vpc_security_group_ids
  associate_public_ip_address = var.associate_public_ip_address
  key_name = var.public_key

  # root_block_device {
  #   volume_size = var.volume_size
  # }
  tags = var.tags
  # lifecycle {
  #   ignore_changes = [
  #     ami,
  #   ]
  # }
}
# resource "aws_key_pair" "imported_keys" {
#     public_key = var.public_key
#     key_name = "${var.name_instance}-key"
# }


# #---------------------------
# # EC2 Alarms
# #---------------------------

# resource "aws_cloudwatch_metric_alarm" "server_ec2_check_failure" {
#   alarm_name                = "${var.name_instance}_status_check_failure_alarm"
#   comparison_operator       = "GreaterThanOrEqualToThreshold"
#   evaluation_periods        = 1
#   metric_name               = "StatusCheckFailed_Instance"
#   namespace                 = "AWS/EC2"
#   period                    = 300
#   statistic                 = "Maximum"
#   threshold                 = 1
#   datapoints_to_alarm       = 1
#   treat_missing_data        = "missing"
#   alarm_description         = "This alarm monitors server status check failures"
#   dimensions = {
#     InstanceId = aws_instance.server.id
#   }
# }

# resource "aws_cloudwatch_metric_alarm" "server_ec2_cpu" {
#   alarm_name                = "${var.name_instance}_status_cpu"
#   comparison_operator       = "GreaterThanOrEqualToThreshold"
#   evaluation_periods        =  1
#   metric_name               = "CPUUtilization"
#   namespace                 = "AWS/EC2"
#   period                    = 300
#   statistic                 = "Average"
#   threshold                 = 60
#   alarm_description         = "This metric monitors server cpu utilization"
#   datapoints_to_alarm       = "1"
#   treat_missing_data        = "missing"
#   insufficient_data_actions = []
#   dimensions = {
#     InstanceId = aws_instance.server.id
#   }
# }

# resource "aws_cloudwatch_metric_alarm" "server_ec2_disk_space" {
#  alarm_name           = "${var.name_instance}_disk_space"
#  comparison_operator  = "GreaterThanOrEqualToThreshold"
#  metric_name          = "disk_used_percent"
#  namespace            = "CWAgent"
#  period               = 300
#  evaluation_periods   = "1"
#  statistic            = "Average"
#  threshold            = "96"
#  datapoints_to_alarm  = "1"
#  alarm_description    = "This metric triggers when he disk space average percentage is over 96% for the last 5 minutes"
#  actions_enabled      = "true"
#  treat_missing_data   = "missing"
#  dimensions = {
#    InstanceType   = aws_instance.server.id
#  }
# }

# resource "aws_cloudwatch_metric_alarm" "server_ec2_ram_usage_alarm" {
#  alarm_name             = "${var.name_instance}_ram_usage"
#  comparison_operator    = "GreaterThanOrEqualToThreshold"
#  evaluation_periods     = "1"
#  metric_name            = "mem_used_percent"
#  namespace              = "CWAgent"
#  period                 = "300"
#  statistic              = "Average"
#  threshold              = "80"
#  alarm_description      = "This metric triggers when RAM usage exceeds 80%"
#  treat_missing_data     = "missing"
#  datapoints_to_alarm    = "1"
#  dimensions = {
#    InstanceId     = aws_instance.server.id
#  }
# }