variable "project_id" {
  description = "The ID of the project in which the resource belongs"
  type        = string
}

variable "secret_id" {
  description = "The Secret ID to create"
  type        = string
}

variable "secret_data" {
  description = "The secret data"
  type        = string
  default     = null
}
