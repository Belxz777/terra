terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}
resource "local_file" "services" {
  # Переводим список в множество (set), чтобы for_each мог его обработать
  for_each = toset(var.services)

  # Создавать отдельный файл для каждого сервиса
  filename = "${path.module}/${each.key}.txt"

  # Формировать содержимое файла с информацией о приложении, окружении и версии
  content = <<-EOT
    App Name: ${var.app_name}
    Env:      ${var.env}
    Version:  ${var.vers}
  EOT
}
