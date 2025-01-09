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
  
  user_data = file(var.user_data)

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