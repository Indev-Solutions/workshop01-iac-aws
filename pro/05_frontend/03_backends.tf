data "terraform_remote_state" "networking" {
  backend = "s3"

  config = {
    bucket = "brstworkshop1"
    key    = "env:/workshop1-pro-networking/rst/iac"
    region = var.region
  }
}
