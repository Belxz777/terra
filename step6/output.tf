output "full_name" {
  description = "The combined project name and environment"
  value       = local.full_name
}

output "instance_count" {
  description = "The number of instances deployed for this environment"
  value       = local.instance_count
}

output "enabled_services" {
  description = "List of services with active ports (greater than 0)"
  # clean_list преобразует массив в строку через запятую для красивого вывода,
  # либо оставьте просто = local.enabled_services_names, если вам нужен сырой JSON-массив
  value       = join(", ", local.enabled_services)
}



output "all_files" {
  description = "path to files"
  value = [
    local_file.srvs.filename,
    local_file.app_info.filename,
  ]
}
