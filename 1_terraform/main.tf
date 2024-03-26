terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.6.0"
    }
  }
}

provider "google" {
  credentials = file(var.credentials)
  project     = var.project
  region      = var.region
}

# GCS Bucket - datalake
resource "google_storage_bucket" "de_project_bucket" {
  name          = var.de_project_gcs_bucket_name
  location      = var.location
  force_destroy = true


  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}


# BigQuery - Warehouse
resource "google_bigquery_dataset" "de_project_dataset" {
  dataset_id = var.de_project_bq_dataset_name
  location   = var.location
}
