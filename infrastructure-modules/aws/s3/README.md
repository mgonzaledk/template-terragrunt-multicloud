# AWS S3 Terraform Module

This is a Terraform module for creating and managing Amazon S3 buckets.

## Usage

Here's an example of how you can use this module:

```hcl
module "s3_bucket" {
  source = "path/to/module/s3"

  bucket_name = "my-s3-bucket"
  bucket_acl  = "private"

  versioning = true
  sse_algorithm = "AES256"

  cors_rule = [
    {
      allowed_headers = ["*"]
      allowed_methods = ["PUT", "POST"]
      allowed_origins = ["https://example.com"]
      expose_headers  = ["ETag"]
      max_age_seconds = 3000
    }
  ]

  lifecycle_rules = [
    {
      id      = "example-rule"
      status  = "Enabled"
      prefix  = "example-prefix/"
      enabled = true
      tags = {
        "rule" = "example"
      }

      noncurrent_version_expiration_days = 30

      noncurrent_version_transitions = [
        {
          days          = 15
          storage_class = "STANDARD_IA"
        },
        {
          days          = 30
          storage_class = "GLACIER"
        }
      ]

      expiration = [
        {
          days = 60
        }
      ]

      transitions = [
        {
          days          = 30
          storage_class = "STANDARD_IA"
        },
        {
          days          = 60
          storage_class = "GLACIER"
        }
      ]
    }
  ]
}
```

## Inputs

| Name | Description | Type | Default | Required |
| --- | --- | --- | --- | --- |
| bucket_name | The name of the bucket | `string` | n/a | yes |
| bucket_acl | The access control list setting for the bucket | `string` | `"private"` | no  |
| versioning | Whether or not to enable versioning | `bool` | `true` | no  |
| sse_algorithm | The server-side encryption algorithm to use | `string` | `"AES256"` | no  |
| cors_rule | A list of rules to apply for CORS | `list` | `[]` | no  |
| lifecycle_rules | List of maps containing configuration of lifecycle rules | `list` | `[]` | no  |

## Outputs

| Name | Description |
| --- | --- |
| bucket_id | The name of the bucket |
| bucket_arn | The ARN of the bucket |

