terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

resource "local_file" "backup" {
    count = var.backup_count
    filename = "${path.module}/backup${count.index}.txt"
    content = "Номер бекапап ${count.index}"
}


resource "local_file" "services" {
for_each = var.services
  filename = "${path.module}/${each.key}.txt"
  content  = <<-EOT
  Service:${each.key}
  Port: ${each.value.port}
  Version:${each.value.version}
  EOT
}
