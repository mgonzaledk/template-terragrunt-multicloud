include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../../infrastructure-modules/aws/s3"
}

inputs = merge(
  local.common_vars,
  {
    bucket_name = "my-s3-bucket-dev"
    # any module-specific variables here...
  }
)
