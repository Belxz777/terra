terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}
resource "local_file" "servers" {
  for_each = var.servers
  filename = "${path.module}/${each.key}.txt"
  content  = "Server ${each.key}"
}
resource "local_file" "serv_map" {
  for_each = var.services
  filename = "${path.module}/${each.key}.md"
  content  = <<-EOT
  Service:${each.key}
  Port: ${each.value.port}
  Version:${each.value.version}
  EOT
}
resource "aws_security_group" "ex" {
  name = "ex"
  dynamic "ingress" {
    for_each = var.ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}
