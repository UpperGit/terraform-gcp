output "user_password" {
  description = "Generated user password"
  value       = random_password.password.result
  sensitive   = true
}

output "certificate" {
  description = "The generated client certificate"
  value       = google_sql_ssl_cert.certificate
  sensitive   = true
}
