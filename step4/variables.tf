variable "servers" {
  type    = set(string)
  default = ["api", "frontend", "worker"]
}
variable "services" {
  type = map(object({
    port    = number
    version = string
  }))

  default = {
    api = {
      port    = 3000
      version = "1.0.0"
    }

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
variable "ports" {
  type    = list(number)
  default = [80, 443, 8080]
}
