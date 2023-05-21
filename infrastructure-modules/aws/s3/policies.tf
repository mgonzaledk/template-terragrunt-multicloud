# This module allows you to configure lifecycle policies for the S3 bucket.
# Lifecycle rules are flexible and allow for transitions to different storage
# classes, deleting non-current versions after a number of days, and much more.

# This resource creates the lifecycle configuration for the S3 bucket. It
# supports all of the lifecycle rules that are supported by the AWS API.
resource "aws_s3_bucket_lifecycle_configuration" "lifecycle" {
  bucket = aws_s3_bucket.bucket.id

  dynamic "rule" {
    for_each = var.lifecycle_rules

    content {
      id      = rule.value.id
      status  = rule.value.status
      prefix  = rule.value.prefix
      enabled = rule.value.enabled
      tags = rule.value.tags

      # Apply noncurrent version expiration.
      dynamic "noncurrent_version_expiration" {
        for_each = rule.value.noncurrent_version_expiration_days != null ? [1] : []
        content {
          days = rule.value.noncurrent_version_expiration_days
        }
      }

      # Apply noncurrent version transitions.
      dynamic "noncurrent_version_transition" {
        for_each = rule.value.noncurrent_version_transitions
        content {
          days          = noncurrent_version_transition.value.days
          storage_class = noncurrent_version_transition.value.storage_class
        }
      }

      # Apply expiration.
      dynamic "expiration" {
        for_each = rule.value.expiration
        content {
          days                   = expiration.value.days
          date                   = expiration.value.date
          expired_object_delete_marker = expiration.value.expired_object_delete_marker
        }
      }

      # Apply transitions.
      dynamic "transition" {
        for_each = rule.value.transitions
        content {
          days          = transition.value.days
          storage_class = transition.value.storage_class
        }
      }
    }
  }
}
