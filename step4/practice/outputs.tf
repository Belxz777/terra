output "backup_files" {
  description = "path to backs"
  sensitive   = false
  value       = [for file in local_file.backup : file.filename]
}
output "service_names" {
  description = "Список названий всех сервисов"
  value       = [for name, details in var.services : name]
}

output "service_ports" {
  description = "Список всех портов"
  value       = [for name, details in var.services : details.port]
}

output "service_port_map" {
  description = "Карта соответствия сервисов и их портов"
  value       = {for name, details in var.services : name => details.port}
}
