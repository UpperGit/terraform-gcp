resource "google_cloudfunctions_function" "function_neg" {
  name        = "function-neg"
  description = "My function"
  runtime     = "nodejs10"

  available_memory_mb   = 128
  source_archive_bucket = google_storage_bucket.bucket.name
  source_archive_object = google_storage_bucket_object.archive.name
  trigger_http          = true
  timeout               = 60
  entry_point           = "helloGET"
}

resource "google_compute_region_network_endpoint_group" "function_negs" {

  provider = google

  for_each = var.private_networks

  name                  = "appengine-neg"
  network_endpoint_type = "SERVERLESS"
  
  region                = each.value["region"]

  app_engine {
    service = google_app_engine_flexible_app_version.appengine_neg.service
    version = google_app_engine_flexible_app_version.appengine_neg.version_id
  }

  cloud_function {
	  function = google_cloudfunctions_function.function_neg.name
  }


}

