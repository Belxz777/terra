variable "project_name" {
  type    = string
  default = "bplan"
}
variable "environment" {
  type    = string
  default = "dev"
  validation {
    condition = contains(
      ["dev", "production", "stage"],
      var.environment
    )
    error_message = "blya ti eblan"
  }
}
variable "port" {
  type    = number
  default = 3000
  validation {
    condition     = var.port >= 1 && var.port <= 65535
    error_message = "nu blya"
  }
}
variable "services" {
  type = map(object({
    port = string
  }))
  default = {
    crawler = {
      port = 3000
    }
    api = {
      port = 3001
    }
    guide = {
      port = 3002
    }
  }
}

locals {
  full_name         = "${var.project_name} - ${var.environment}"
  environment_upper = upper(var.environment)
  instance_count    = var.environment == "production" ? 3 : 1
  enabled_services  = [for name, service in var.services : name if service.port > 0]
}
