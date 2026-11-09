terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}
resource "local_file" "server" {
  filename = "${path.module}/${var.server_name}.txt"

  content = <<-EOT
        Server: ${var.server_name}
        Env: ${var.env}
        Port: ${var.server_port}
    EOT
}
