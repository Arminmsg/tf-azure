# Configure the Azure provider
terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.52.0"
    }
  }

  cloud {
    organization = "armin-mesic"

    workspaces {
      name = "gcp-demo"
    }
  }

  required_version = ">= 0.14"
}

provider "google" {
  access_token = var.GCP_ACCESS_TOKEN

  project = var.project_id
  region  = var.region
  zone    = "us-central1-c"
}

variable "region" {
  default = "us-central1"
}

variable "project_id" {
  default = "project_id"
}