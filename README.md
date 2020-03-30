
# Terraform AWS CloudTrail

This module creates AWS CloudTrail and configures it so that logs go to cloudwatch.

## Terraform Versions

Terraform 0.12. Pin module version to `~> 2.X`. Submit pull-requests to `master` branch.

Terraform 0.11. Pin module version to `~> 1.X`. Submit pull-requests to `terraform011` branch.

## Usage

```hcl
module "aws_cloudtrail" {
    source             = "trussworks/cloudtrail/aws"
    s3_bucket_name     = "my-company-cloudtrail-logs"
    log_retention_days = 90
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| cloudwatch\_log\_group\_kms\_key\_arn | The ARN of the KMS key used to encrypt the CloudWatch log group storing CloudTrail logs.  If blank, then logs are unencrypted. | `string` | `""` | no |
| cloudwatch\_log\_group\_name | The name of the CloudWatch Log Group that receives CloudTrail events. | `string` | `"cloudtrail-events"` | no |
| cloudwatch\_log\_group\_retention\_in\_days | Number of days to keep the CloudTrail logs in the CloudWatch log group. | `string` | `90` | no |
| enabled | Enables logging for the trail. Defaults to true. Setting this to false will pause logging. | `bool` | `true` | no |
| encrypt\_cloudtrail | Whether or not to use a custom KMS key to encrypt CloudTrail logs. | `string` | `"false"` | no |
| key\_deletion\_window\_in\_days | Duration in days after which the key is deleted after destruction of the resource, must be 7-30 days.  Default 30 days. | `string` | `30` | no |
| org\_trail | Whether or not this is an organization trail. Only valid in master account. | `string` | `"false"` | no |
| s3\_bucket\_name | The name of the AWS S3 bucket. | `string` | n/a | yes |
| s3\_key\_prefix | S3 key prefix for CloudTrail logs | `string` | `"cloudtrail"` | no |
| trail\_name | Name for the Cloudtrail | `string` | `"cloudtrail"` | no |

## Outputs

| Name | Description |
|------|-------------|
| cloudtrail\_arn | CloudTrail ARN |
| cloudtrail\_home\_region | CloudTrail Home Region |
| cloudtrail\_id | CloudTrail ID |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Upgrade Paths

### Upgrading from 2.0.4 to 2.1.0

The `log_retention_days` variable is now named `cloudwatch_log_group_retention_in_days`.

## Developer Setup

Install dependencies (macOS)

```shell
brew install pre-commit go terraform terraform-docs
```

### Testing

[Terratest](https://github.com/gruntwork-io/terratest) is being used for
automated testing with this module. Tests in the `test` folder can be run
locally by running the following command:

```text
make test
```

Or with aws-vault:

```text
AWS_VAULT_KEYCHAIN_NAME=<NAME> aws-vault exec <PROFILE> -- make test
```
