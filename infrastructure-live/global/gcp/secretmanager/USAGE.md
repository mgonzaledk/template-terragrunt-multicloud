# Usage

Once the secret is created, you can reference it in your other modules/environments. Since the secret is in GCP Secret Manager, you can use the Secret Manager's APIs to access the secret in your applications or other Terraform modules. If you're using it in another Terraform module, you would use a data block to fetch the secret.

For example, in one of your other modules, you might have something like:

```hcl

data "google_secret_manager_secret_version" "secret_version" {
  secret_id = "global-secret"
  version   = "latest"
}

output "secret_data" {
  value = data.google_secret_manager_secret_version.secret_version.secret_data
}
```

Remember to set appropriate access permissions so the service accounts used in other environments can access the secret.
