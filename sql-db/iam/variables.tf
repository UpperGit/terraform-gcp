variable "database_instance_name" {
  type        = string
  description = "Database instance name to create the database"
}

variable "common_name" {
  type        = string
  description = "TLS certificate common name"
}

variable "username" {
  type        = string
  description = "Database name"
}

variable "password_keeper" {
  type        = string
  description = "Password keeper (everytime this value change de password will be reset)"
  default     = "initial"
}

variable "enable_tls" {
  type        = bool
  description = "Enable TLS authentication"
  default     = true
}

variable "enable_password" {
  type        = bool
  description = "Enable password authentication"
  default     = true
}
