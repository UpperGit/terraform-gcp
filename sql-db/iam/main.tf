############################
# Certificate
############################

resource "google_sql_ssl_cert" "certificate" {
  count       = var.enable_tls ? 1 : 0

  provider = google

  common_name = var.common_name
  instance    = var.database_instance_name
}

############################
# Password
############################

resource "random_password" "password" {
  keepers = {
    password_keeper = var.password_keeper
  }
  length           = 18
  special          = true
  override_special = "_%@#-$"
}

resource "google_sql_user" "client_password" {
  count       = var.enable_password ? 1 : 0

  provider = google

  instance    = var.database_instance_name
  name = var.username
  password    = random_password.password.result
}
