variable "database_instance_name" {
  type        = string
  description = "Database instance name to create the database"
}

variable "database_name" {
  type        = string
  description = "Database name"
}

variable "charset" {
  type        = string
  description = "Database charset"
  default     = null
}

variable "collation" {
  type        = string
  description = "Database collation"
  default     = null
}
