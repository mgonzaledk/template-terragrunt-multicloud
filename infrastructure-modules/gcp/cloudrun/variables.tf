variable "project_id" {
  description = "The ID of the project in which the resource belongs."
  type        = string
}

variable "location" {
  description = "Location to deploy Cloud Run service."
  type        = string
  default     = "us-central1"
}

variable "service_name" {
  description = "Name of the Cloud Run service."
  type        = string
}

variable "image" {
  description = "Docker image to deploy to the Cloud Run service."
  type        = string
}

variable "environment_variables" {
  description = "Map of environment variables that will be passed to the service."
  type        = map(string)
  default     = {}
}

variable "secret_variables" {
  description = "Map of secret references that will be passed to the service."
  type        = map(string)
  default     = {}
}
