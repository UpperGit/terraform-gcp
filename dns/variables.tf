variable "prefix" {
  type        = string
  description = "Resources name prefix, you can use something like the environment slug or a unique commit hash"
}

variable "name" {
  type        = string
  description = "Unique network name, suggestion: use a slug like 'my_network'"
}

variable "dns_zone" {
  type        = string
  description = "Root DNS zone name"
  default = "private.com"
}

variable "labels" {
  type        = map
  description = "Custom resource labels"
  default     = {}
}

variable "private_network_ids" {
  type        = list
  description = "VPC private IDs that have access to this DNS"
  default     = []
}

variable "is_private" {
  type        = bool
  description = "Is a private DNS"
  default     = true
}
