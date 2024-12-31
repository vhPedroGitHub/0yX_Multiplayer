variable "runtime" {
  type    = string
  default = "python3.10"
}
variable "compatible_runtimes" {
  type    = list(string)
  default = ["python3.10"]
}
variable "file_zip" {
  type    = string
  default = null
}
variable "skip_destroy" {
  type    = bool
  default = true
}
variable layer_paths{
    type = list(string)
}
variable layer_zip_name{
    type = string
}
variable layer_name{
    type = string
}
variable bucket_name{
    type = string
}