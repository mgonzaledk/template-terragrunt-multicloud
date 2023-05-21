output "secret_name" {
  description = "The resource name of the Secret"
  value = google_secret_manager_secret.secret.name
}
