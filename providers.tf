terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.24.0"
    }
  }

  backend "gcs" {
    bucket = "jo-terraform-states"
    prefix = "firewall-policies"
  }
}

provider "google" {
  project = "jo-shared-services-lzzo"
  region  = "us-central1"
}
