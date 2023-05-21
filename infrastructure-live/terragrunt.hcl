remote_state {
  backend = "gcs"
  config = {
    bucket  = "my-terraform-state"
    prefix  = "terraform/state"
  }
}

locals {
  common_vars = {
    aws_region  = "us-west-2"
    aws_profile = "default"
    gcp_project     = "my-gcp-project"
    gcp_credentials = "/path/to/credentials.json"
    gcp_region      = "us-central1"
  }
}
