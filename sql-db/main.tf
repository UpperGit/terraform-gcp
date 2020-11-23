############################
# Master instance
############################

resource "google_sql_database_instance" "master" {
  provider = google-beta

  name = "${var.prefix}-${var.region}-${var.name}"

  region              = var.region
  database_version    = var.database_version
  root_password       = var.root_password
  deletion_protection = var.deletion_protection

  settings {
    tier              = var.tier
    disk_autoresize   = true
    disk_type         = "PD_SSD"
    pricing_plan      = "PER_USE"

    availability_type = var.availability_type

    ip_configuration {
      ipv4_enabled    = false
      private_network = var.private_network_id
      require_ssl     = true
    }

    backup_configuration {
      binary_log_enabled = var.availability_type == "REGIONAL" ? true : false
      enabled            = var.backup_enabled
    }

    maintenance_window {
      update_track = "stable"
      day          = var.maintenance_window_day
      hour         = var.maintenance_window_hour
    }

    user_labels = merge(
      var.labels,
      {
        name   = "${var.prefix}-${var.region}-${var.name}",
        prefix = var.prefix,
      }
    )

  }
}

############################
# Failover instances
############################

resource "google_sql_database_instance" "failover" {

  count = var.availability_type == "REGIONAL" ? var.failover_instance_count : 0

  provider = google-beta

  depends_on = [
    google_sql_database_instance.master,
  ]

  name = "${var.prefix}-${var.region}-${var.name}-failover-${count.index}"

  region              = var.region
  database_version    = var.database_version
  root_password       = var.root_password
  deletion_protection = var.deletion_protection

  master_instance_name = var.availability_type == "REGIONAL" ? google_sql_database_instance.master.name : null

  replica_configuration {
    failover_target = true
  }

  settings {
    crash_safe_replication = true
    
    tier              = var.tier
    disk_autoresize   = true
    disk_type         = "PD_SSD"
    pricing_plan      = "PER_USE"

    availability_type = var.availability_type

    ip_configuration {
      ipv4_enabled    = false
      private_network = var.private_network_id
      require_ssl     = true
    }

    backup_configuration {
      binary_log_enabled = var.availability_type == "REGIONAL" ? true : false
      enabled            = var.backup_enabled
    }

    maintenance_window {
      update_track = "stable"
      day          = var.maintenance_window_day
      hour         = var.maintenance_window_hour
    }

    user_labels = merge(
      var.labels,
      {
        name   = "${var.prefix}-${var.region}-${var.name}",
        prefix = var.prefix,
      }
    )

  }
}

############################
# Read replicas instances
############################

resource "google_sql_database_instance" "read" {

  count = var.availability_type == "REGIONAL" ? var.read_replica_count : 0

  provider = google-beta

  depends_on = [
    google_sql_database_instance.master,
  ]

  name = "${var.prefix}-${var.region}-${var.name}-read-${count.index}"

  region              = var.region
  database_version    = var.database_version
  root_password       = var.root_password
  deletion_protection = var.deletion_protection

  master_instance_name = var.availability_type == "REGIONAL" ? google_sql_database_instance.master.name : null

  replica_configuration {
    failover_target = false
  }

  settings {
    
    tier              = var.tier
    disk_autoresize   = true
    disk_type         = "PD_SSD"
    pricing_plan      = "PER_USE"

    availability_type = var.availability_type

    ip_configuration {
      ipv4_enabled    = false
      private_network = var.private_network_id
      require_ssl     = true
    }

    backup_configuration {
      binary_log_enabled = var.availability_type == "REGIONAL" ? true : false
      enabled            = var.backup_enabled
    }

    maintenance_window {
      update_track = "stable"
      day          = var.maintenance_window_day
      hour         = var.maintenance_window_hour
    }

    user_labels = merge(
      var.labels,
      {
        name   = "${var.prefix}-${var.region}-${var.name}",
        prefix = var.prefix,
      }
    )

  }
}
