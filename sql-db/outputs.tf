output "database_instance_name" {
  description = "Database master instance name"
  value       = google_sql_database_instance.master.name
  sensitive   = false
}
