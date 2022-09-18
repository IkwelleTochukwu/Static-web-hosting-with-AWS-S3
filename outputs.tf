output "root_bucket_arn" {
  description = "the arn value for the root bucket"
  value       = aws_s3_bucket.root_domain_bucket.arn
}

output "sub_domain_bucket_arn" {
  description = "the arn value for the subdomain bucket"
  value       = aws_s3_bucket.sub_domain_bucket.arn
}

output "logs_bucket_arn" {
  description = "the arn value for the logs bucket"
  value       = aws_s3_bucket.logs_s3_bucket.arn
}

output "root_bucket_domain_name" {
  description = "the root bucket domain name"
  value       = aws_s3_bucket.root_domain_bucket.bucket_domain_name
}

output "root_bucket_region" {
  description = "the AWS region where the buckets resides in"
  value       = aws_s3_bucket.root_domain_bucket.region
}

output "root_bucket_website_endpoint" {
  description = "the website endpoint of the root bucket"
  value       = aws_s3_bucket.root_domain_bucket.website_endpoint
}

output "root_bucket_website_domain" {
  description = "the website domain for the root bucket"
  value       = aws_s3_bucket.root_domain_bucket.website_domain
}