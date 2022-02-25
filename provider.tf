provider "google" {
  project = local.projects[terraform.workspace]
  region = "asia-northeast1"
}

provider "google-beta" {
  project = local.projects[terraform.workspace]
  region = "asia-northeast1"
}

locals {
  projects = {
    prd = ""
    stg = ""
    dev = "handson-pca"
  }
}
