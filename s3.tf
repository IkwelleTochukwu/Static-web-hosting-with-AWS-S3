/* To create three(3) AWS s3 buckets for use as root domain bucket,
sub-domain bucket and logging bucket.*/

######## root domain bucket creation ##########

resource "aws_s3_bucket" "root_domain_bucket" {
  bucket = var.root_bucket_name
  tags   = var.resource_tags
}

resource "aws_s3_bucket_logging" "root_domain_logs" {
  bucket        = aws_s3_bucket.root_domain_bucket.id
  target_bucket = aws_s3_bucket.logs_s3_bucket.id
  target_prefix = "log/"
}

resource "aws_s3_object" "bucket_objects" {
  bucket = aws_s3_bucket.root_domain_bucket.id
  key    = "index.html"
  source = "./index.html"
  etag   = filemd5("./index.html")
}

resource "aws_s3_bucket_policy" "allowGetObjectAccess" {
  bucket = aws_s3_bucket.root_domain_bucket.id
  policy = file("./policy.json")
}

resource "aws_s3_bucket_website_configuration" "static_web_hosting" {
  bucket = aws_s3_bucket.root_domain_bucket.id
  index_document {
    suffix = "index.html"
  }
}


####### sub-domain bucket creation #########

resource "aws_s3_bucket" "sub_domain_bucket" {
  bucket = var.sub_domain_bucket_name
  tags   = var.resource_tags
}

resource "aws_s3_bucket_website_configuration" "redirecting_bucket_endpoint" {
  bucket = var.sub_domain_bucket_name
  redirect_all_requests_to {
    host_name = var.root_bucket_name
    protocol  = "http"
  }
}

######## logs bucket creation ############

resource "aws_s3_bucket" "logs_s3_bucket" {
  bucket = var.log_bucket_name
  tags   = var.resource_tags
}

resource "aws_s3_object" "log_folder" {
  bucket       = aws_s3_bucket.logs_s3_bucket.id
  key          = "logs/"
  content_type = "application/x-directory"
}

