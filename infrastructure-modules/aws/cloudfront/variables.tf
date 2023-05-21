variable "origins" {
  description = "A list of origins for the CloudFront distribution"
  type = list(object({
    domain_name           = string
    origin_id             = string
    origin_access_identity = string
  }))
}

variable "enabled" {
  description = "Whether the distribution is enabled to accept end user requests for content"
  type        = bool
  default     = true
}

variable "is_ipv6_enabled" {
  description = "Whether IPv6 is enabled for the distribution"
  type        = bool
  default     = false
}

variable "comment" {
  description = "Any comments you want to include about the distribution"
  type        = string
  default     = ""
}

variable "default_root_object" {
  description = "The object that you want CloudFront to return when an end user requests the root URL"
  type        = string
  default     = "index.html"
}

variable "default_cache_behavior" {
  description = "The default cache behavior for the CloudFront distribution"
  type = object({
    target_origin_id       = string
    viewer_protocol_policy = string
    allowed_methods        = list(string)
    cached_methods         = list(string)
    query_string           = bool
    headers                = list(string)
  })
}

variable "ordered_cache_behavior" {
  description = "An ordered list of cache behaviors for the CloudFront distribution"
  type = list(object({
    path_pattern            = string
    target_origin_id        = string
    viewer_protocol_policy  = string
    allowed_methods         = list(string)
    cached_methods          = list(string)
    query_string            = bool
    headers                 = list(string)
  }))
  default = []
}

variable "restriction_type" {
  description = "The method that you want to use to restrict distribution of your content by country"
  type        = string
  default     = "none"
}

variable "locations" {
  description = "A list of country codes, if you want to geographically restrict the distribution of your content"
  type        = list(string)
  default     = []
}

variable "acm_certificate_arn" {
  description = "The ARN of the AWS Certificate Manager certificate to use"
  type        = string
  default     = null
}

variable "ssl_support_method" {
  description = "The SSL support method (sni-only, vip)"
  type        = string
  default     = "sni-only"
}

variable "minimum_protocol_version" {
  description = "The minimum version of the SSL protocol that you want CloudFront to use for HTTPS connections"
  type        = string
  default     = "TLSv1.2_2018"
}

variable "cloudfront_default_certificate" {
  description = "If true, CloudFront will use its own certificate for SSL connections"
  type        = bool
  default     = false
}

variable "price_class" {
  description = "The price class for this distribution (PriceClass_All, PriceClass_200, PriceClass_100)"
  type        = string
  default     = "PriceClass_100"
}
