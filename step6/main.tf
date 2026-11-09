terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

resource "local_file" "app_info" {
  filename = "${path.module}/app_info.txt"
  content  = <<-EOF
  Name: ${local.full_name}
  Environment :${local.environment_upper}
  Instances :${local.instance_count}
  EOF
}
resource "local_file" "srvs" {
  filename = "${path.module}/services.txt"
  content = join("\n", [
    for name, service in var.services : "${name} runs on port ${service.port}"
  ])
}
