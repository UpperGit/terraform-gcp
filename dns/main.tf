resource "google_dns_managed_zone" "zone" {
  provider = google

  name        = "${var.prefix}-${var.name}"
  dns_name    = "${var.dns_zone}."

  labels = merge(
    var.labels,
    {
      name   = "${var.prefix}-${var.name}",
      prefix = var.prefix,
    }
  )

  visibility = var.is_private ? "private" : "public"

  dynamic "private_visibility_config" {
    for_each = var.is_private ? ["default"] : []

    content {

      dynamic "networks" {
        for_each = var.private_network_ids

        content {
          network_url = networks.value
        }

      }

    }

  }

}
