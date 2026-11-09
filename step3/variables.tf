variable "env" {
  description = "Dep env"
  type        = string
  default     = "development"
}
variable "server_name" {
  description = "Server name"
  type        = string
  default     = "web-server"
}
variable "server_port" {
  description = "ext server port"
  type        = number
  default     = 8001
}
