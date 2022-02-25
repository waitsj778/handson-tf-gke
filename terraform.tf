##############################################################
# Terraformのバージョンを固定する
##############################################################
locals {
  bucket_name = "[YOUR PROJECT ID]-terraform-backend"
}

terraform {
  required_version = "= 0.14.10"

  backend "gcs" {
    bucket = locals.bucket_name
    prefix = "tfstate"
  }
}
