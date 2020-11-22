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
  default     = "private.com"
}

variable "records" {
  type        = map
  description = "Map of subdomains => record_set metadata"
  default = {

    "sample-endpoint" = {
      
      type = "A"
      ttl  = 60
      record_set = [
        "1.1.1.1",
      ]

    }
    
  }
}
