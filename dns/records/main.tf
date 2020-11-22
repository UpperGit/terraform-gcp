resource "google_dns_record_set" "frontend" {
  provider = google

  for_each = { for subdomain, record in var.records : "${subdomain}-${record.type}" => merge(record, { subdomain = subdomain }) }

  name = "${each.value["subdomain"]}.${var.dns_zone}"
  type = each.value["type"]
  ttl  = each.value["ttl"]

  managed_zone = "${var.prefix}-${var.name}"

  rrdatas = each.value["record_set"]
}
