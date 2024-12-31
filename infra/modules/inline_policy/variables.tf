variable "role_name" {
 description = "role_name"
 type = string
}

variable "statements" {
 description = "Lista de statements para la política IAM"
 type = list(object({
    effect    = string
    actions   = list(string)
    resources = list(string)
 }))
 default = []
}