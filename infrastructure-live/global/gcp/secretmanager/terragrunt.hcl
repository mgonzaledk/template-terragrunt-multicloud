include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../../infrastructure-modules/gcp/secretmanager"
}

inputs = merge(
  local.common_vars,
  {
    secret_id   = "global-secret"
    secret_data = "supersecret"
    # any module-specific variables here...
  }
)
