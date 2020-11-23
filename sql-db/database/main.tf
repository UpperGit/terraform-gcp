############################
# Database
############################

resource "google_sql_database" "database" {
  provider = google

  name     = var.database_name
  instance = var.database_instance_name

  charset   = var.charset
  collation = var.collation
}
