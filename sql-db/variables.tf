variable "prefix" {
  type        = string
  description = "Resources name prefix, you can use something like the environment slug or a unique commit hash"
}

variable "name" {
  type        = string
  description = "Unique network name, suggestion: use a slug like 'my_network'"
}

variable "region" {
  type        = string
  description = "Region where the db cluster is"
  default     = "us-central1"
}

variable "private_network_id" {
  type        = string
  description = "VPC network ID to create private instance"
}

variable "database_version" {
  type        = string
  description = "Database engine and version (see https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance#database_version)"
  default     = "MYSQL_5_7"
}

variable "root_password" {
  type        = string
  description = "Initial root password. Required for MS SQL Server, ignored by MySQL and PostgreSQL."
  default     = ""
}

variable "deletion_protection" {
  type        = bool
  description = "Whether or not to allow Terraform to destroy the instance."
  default     = false
}

variable "tier" {
  type        = string
  description = "Database SKU tier machine type (see https://cloud.google.com/sql/pricing#2nd-gen-pricing)"
  default     = "db-f1-micro"
}

variable "availability_type" {
  type        = string
  description = "The availability type of the Cloud SQL instance, high availability (REGIONAL) or single zone (ZONAL)"
  default     = "ZONAL"
}

variable "labels" {
  type        = map
  description = "Custom resource labels"
  default     = {}
}

variable "backup_enabled" {
  type        = bool
  description = "Enables backup"
  default     = false
}

variable "failover_instance_count" {
  type        = number
  description = "Number of failover instances"
  default       = 0
}

variable "read_replica_count" {
  type        = number
  description = "Number of read replicas"
  default       = 0
}

variable "maintenance_window_day" {
  description = "The day of week (1-7) for the master instance maintenance."
  type        = number
  default     = 1
}

variable "maintenance_window_hour" {
  description = "The hour of day (0-23) maintenance window for the master instance maintenance."
  type        = number
  default     = 23
}
