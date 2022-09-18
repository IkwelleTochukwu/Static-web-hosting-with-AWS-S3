variable "root_bucket_name" {
  description = "Name of root domain bucket"
  type        = string
}

variable "log_bucket_name" {
  description = "Name of logs bucket"
  type        = string
}

variable "sub_domain_bucket_name" {
  description = "Name of sub_domain bucket"
  type        = string
}

variable "resource_tags" {
  description = "tags name for project resources"
  type        = map(string)
  default = {
    "name" = "staticwebhosting"
    "env"  = "demo"
  }
}

variable "s3_hostedzone" {
  description = "the hosted zone for route53"
  type        = string
}
