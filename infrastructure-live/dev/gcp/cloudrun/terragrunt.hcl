include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../../infrastructure-modules/gcp/cloudrun"
}

dependency "secretmanager" {
  config_path = "../../global/gcp/secretmanager"
}

inputs = merge(
  local.common_vars,
  {
    secretmanager_outputs = dependency.secretmanager.outputs
    # any module-specific variables here...
  }
)
