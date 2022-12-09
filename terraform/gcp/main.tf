terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.43.0"
    }
  }
  backend "gcs" {
    bucket = "argue-ops-terraform-state"
    prefix = "handson"
  }
}

provider "google" {
  # Configuration options
  project = "playground-369107"
  region  = "europe-west1"
}