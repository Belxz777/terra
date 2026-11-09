terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}
resource "local_file" "database" {
  filename = "${path.module}/db.txt"
  content  = "Db config "
}
resource "local_file" "config" {
  filename = "${path.module}/cfg.txt"
  content  = "implicit : ${local_file.database.filename}"
}
resource "local_file" "app" {
  filename   = "${path.module}/app.txt"
  content    = "explisit "
  depends_on = [local_file.config]

}
