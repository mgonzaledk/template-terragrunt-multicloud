variable "bucket_name" {
  description = "The name of the bucket"
  type        = string
}

variable "bucket_acl" {
  description = "The access control list setting for the bucket"
  type        = string
  default     = "private"
}

variable "versioning" {
  description = "Whether or not to enable versioning"
  type        = bool
  default     = true
}

variable "sse_algorithm" {
  description = "The server-side encryption algorithm to use"
  type        = string
  default     = "AES256"
}

variable "cors_rule" {
  description = "A list of rules to apply for CORS"
  type = list(object({
    allowed_headers = list(string)
    allowed_methods = list(string)
    allowed_origins = list(string)
    expose_headers  = list(string)
    max_age_seconds = number
  }))
  default = []
}

variable "lifecycle_rules" {
  description = "List of maps containing configuration of lifecycle rules"
  type = list(object({
    id      = string
    status  = string
    prefix  = string
    tags = map(string)
    enabled = bool

    noncurrent_version_expiration_days = number
    noncurrent_version_transitions = list(object({
      days          = number
      storage_class = string
    }))

    expiration = list(object({
      days                   = number
      date                   = string
      expired_object_delete_marker = bool
    }))

    transitions = list(object({
      days          = number
      storage_class = string
    }))
  }))

  default = []
}
