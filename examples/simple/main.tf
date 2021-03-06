module "aws_cloudtrail" {
  source         = "../../"
  s3_bucket_name = module.logs.aws_logs_bucket
}

module "logs" {
  source         = "trussworks/logs/aws"
  version        = "~> 5"
  s3_bucket_name = var.logs_bucket
  region         = var.region
  force_destroy  = true
}
