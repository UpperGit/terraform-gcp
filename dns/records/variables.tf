variable "prefix" {
  type        = string
  description = "Resources name prefix, you can use something like the environment slug or a unique commit hash"
}

variable "name" {
  type        = string
  description = "Unique zone name, suggestion: use a slug like 'my_dns_zone'"
}

variable "dns_zone" {
  type        = string
  description = "Root DNS zone name"
  default     = "private.com"
}

variable "records" {
  type        = list
  description = "Map of subdomains => record_set metadata"
  default = [

    {

      subdomain = "sample-endpoint"
      type = "A"
      ttl  = 60
      record_set = [
        "1.1.1.1",
      ]

    }
    
  ]
}
