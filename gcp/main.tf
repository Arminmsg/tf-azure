# Configure the Azure provider
terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.5.0"
    }
  }

  cloud {
    organization = "armin-mesic"

    workspaces {
      name = "gcp-demo"
    }
  }

  required_version = ">= 1.1.0"
}

provider "google" {
  access_token = var.GCP_ACCESS_TOKEN

  project = "main-tokenizer-364009"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}