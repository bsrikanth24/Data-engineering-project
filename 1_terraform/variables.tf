variable "credentials" {
  description = "de-project credentials"
  default     = "./.keys/key.json"
  #ex: if you have a directory where this file is called keys with your service account json file
  #saved there as my-creds.json you could use default = "./keys/my-creds.json"
}


variable "project" {
  description = "de-project"
  default     = "de-project-417908"
}

variable "region" {
  description = "Region"
  #Update the below to your desired region
  default     = "us-central1"
}

variable "zone" {
  description = "The zone where the GCP resources will be created."
  default     = "us-central1-a"
}

variable "location" {
  description = "Project Location"
  #Update the below to your desired location
  default     = "US"
}

variable "de_project_bq_dataset_name" {
  description = "de-project BigQuery Dataset Name"
  #Update the below to what you want your dataset to be called
  default     = "de_project_bq_dataset"
}

variable "de_project_gcs_bucket_name" {
  description = "My Storage Bucket Name"
  #Update the below to a unique bucket name
  default     = "de_project_gcs_bucket"
}

variable "gcs_storage_class" {
  description = "Bucket Storage Class"
  default     = "STANDARD"
}

