output "server_name" {
  description = "create srv_name"
  value       = var.server_name
}
output "env" {
  description = "curr env"
  value       = var.env
}
output "server_file" {
  description = "path to generated file"
  sensitive = false
  value       = local_file.server.filename
}
