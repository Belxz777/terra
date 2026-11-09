output "all_files" {
  description = "path to files"
  sensitive   = false
  value = [
    local_file.database.filename,
    local_file.config.filename,
    local_file.app.filename
  ]
}
