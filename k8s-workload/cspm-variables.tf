variable "cspm-key-id" {
    description = "Insert your API Key ID"
    sensitive = true
    type = string
    default = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
}
variable "cspm-key-secret" {
    description = "Insert your API Key Secret"
    sensitive = true
    type = string
    default = "xxxxxxxxxxxxxxxxxxxx"
}
variable "cspm-org-unit" {
    description = "Insert the name of your Organizational Unit"
    type = string
}
variable "cspm-admin-mail" {
    description = "Give me your mail address"
    sensitive = true
    type = string
}