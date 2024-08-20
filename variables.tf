variable "project_id" {
  description = "The GCP project ID"
  #default     = "terraform-gcp-431811"
}

variable "location" {
  description = "The GCP region"
  #default     = "europe-west1"
}

variable "zone" {
  description = "The GCP zone"
  #default     = "europe-west1-b"
}




variable "buckets" {
  description = "Map of bucket configurations"
  type = map(object({

    location                    = string
    storage_class               = string
    uniform_bucket_level_access = bool
    force_destroy               = bool
    versioning = object({
      enabled = bool
    })
    logging = object({
      log_bucket        = string
      log_object_prefix = string
    })
    lifecycle_rule = list(object({
      action = object({
        type = string
      })
      condition = object({
        age                   = number
        created_before        = string
        with_state            = string
        matches_storage_class = list(string)
        num_newer_versions    = number
      })
    }))

  }))

}