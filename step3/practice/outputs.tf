output "app_name" {
  description = "create app"
  value       = var.app_name
}
output "env" {
  description = "curr env"
  value       = var.env
}
output "created_services" {
  description = "out all files "
  value       = [for file in local_file.services : file.filename]
}
