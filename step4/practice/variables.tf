variable "backup_count" {
  type    = number
  default = 3
}
variable "services" {
  type = map(object({
    port    = number
    version = string
  }))

  default = {

    frontend = {
      port    = 5173
      version = "2.0.0"
    }

    worker = {
      port    = 9000
      version = "1.5.0"
    }

  }
}
