variable "app_name" {
  description = "app name"
  type        = string
  default     = "x.com"
}
variable "services" {
  description = "List of resources"
  type        = list(string)
  default     = ["s3", "tg_bot", "ufw"]
}
variable "vers" {
  description = "app_version"
  type        = string
  default     = "1.1.1"
}
variable "env" {
  description = "env"
  type        = string
  default     = "prod"
}
