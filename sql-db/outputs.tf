output "client_cert" {
  description = "A root client certificate"
  value       = google_sql_ssl_cert.client_cert
  sensitive   = true
}
