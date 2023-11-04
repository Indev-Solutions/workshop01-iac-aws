data "terraform_remote_state" "networking" {
  backend = "s3"
  config = {
    bucket = "brstworkshop1"
    key    = "workshop1/iac/rst/pro/networking"
    region = var.region
  }
}
