resource "google_dns_record_set" "record_set" {
  provider = google

  for_each = { for record in var.records : "${record.subdomain}-${record.type}" => record }

  name = "${each.value["subdomain"]}.${var.dns_zone}."
  type = each.value["type"]
  ttl  = each.value["ttl"]

  managed_zone = "${var.prefix}-${var.name}"

  rrdatas = each.value["record_set"]
}
