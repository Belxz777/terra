terraform {
  required_version = ">=1.5.0"
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}
resource "local_file" "server" {
  filename = "${path.module}/server.txt"
  content  = "Production server"
}
resource "local_file" "database" {
  filename = "${path.module}/database.txt"
  content  = "Postgres database"
}
resource "local_file" "cache" {
  filename = "${path.module}/cache.txt"
  content  = "Redis cache"
}
