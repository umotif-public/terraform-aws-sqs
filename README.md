![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/umotif-public/terraform-aws-sqs?style=social)

# terraform-aws-sqs
Terraform module which creates Simple Queue Service(SQS) resources in AWS

## Terraform versions

Terraform 1.0.0. Pin module version to `~> v1.0`. Submit pull-requests to `main` branch.

## Usage

```hcl
module "sqs" {
  source = "umotif-public/sqs/aws"
  version = "~> 1.0.0"

  name_prefix = "core-sqs-example-"

  fifo_queue            = true
  fifo_throughput_limit = "perMessageGroupId"

  content_based_deduplication = true
  deduplication_scope         = "messageGroup"

  kms_master_key_id = "alias/aws/sqs"
}
```

## Examples

* [SQS](https://github.com/umotif-public/terraform-aws-sqs/tree/main/examples/core)

## Authors

Module managed by [Marcin Cuber](https://github.com/marcincuber) [LinkedIn](https://www.linkedin.com/in/marcincuber/).

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.46 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.46 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_sqs_queue.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_content_based_deduplication"></a> [content\_based\_deduplication](#input\_content\_based\_deduplication) | Enables content-based deduplication for FIFO queues | `bool` | `false` | no |
| <a name="input_deduplication_scope"></a> [deduplication\_scope](#input\_deduplication\_scope) | Specifies whether message deduplication occurs at the message group or queue level. Valid values are `messageGroup` and `queue` (default). | `string` | `"queue"` | no |
| <a name="input_delay_seconds"></a> [delay\_seconds](#input\_delay\_seconds) | The time in seconds that the delivery of all messages in the queue will be delayed. An integer from 0 to 900 (15 minutes) | `number` | `0` | no |
| <a name="input_fifo_queue"></a> [fifo\_queue](#input\_fifo\_queue) | Boolean designating a FIFO queue | `bool` | `false` | no |
| <a name="input_fifo_throughput_limit"></a> [fifo\_throughput\_limit](#input\_fifo\_throughput\_limit) | pecifies whether the FIFO queue throughput quota applies to the entire queue or per message group. Valid values are `perQueue` (default) and `perMessageGroupId`. | `string` | `"perQueue"` | no |
| <a name="input_kms_data_key_reuse_period_seconds"></a> [kms\_data\_key\_reuse\_period\_seconds](#input\_kms\_data\_key\_reuse\_period\_seconds) | The length of time, in seconds, for which Amazon SQS can reuse a data key to encrypt or decrypt messages before calling AWS KMS again. An integer representing seconds, between 60 seconds (1 minute) and 86,400 seconds (24 hours) | `number` | `300` | no |
| <a name="input_kms_master_key_id"></a> [kms\_master\_key\_id](#input\_kms\_master\_key\_id) | The ID of an AWS-managed customer master key (CMK) for Amazon SQS or a custom CMK | `string` | `null` | no |
| <a name="input_max_message_size"></a> [max\_message\_size](#input\_max\_message\_size) | The limit of how many bytes a message can contain before Amazon SQS rejects it. An integer from 1024 bytes (1 KiB) up to 262144 bytes (256 KiB) | `number` | `262144` | no |
| <a name="input_message_retention_seconds"></a> [message\_retention\_seconds](#input\_message\_retention\_seconds) | The number of seconds Amazon SQS retains a message. Integer representing seconds, from 60 (1 minute) to 1209600 (14 days) | `number` | `345600` | no |
| <a name="input_name"></a> [name](#input\_name) | This is the human-readable name of the queue. If omitted, Terraform will assign a random name. | `string` | `null` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | A unique name beginning with the specified prefix. | `string` | `null` | no |
| <a name="input_policy"></a> [policy](#input\_policy) | The JSON policy for the SQS queue | `string` | `null` | no |
| <a name="input_receive_wait_time_seconds"></a> [receive\_wait\_time\_seconds](#input\_receive\_wait\_time\_seconds) | The time for which a ReceiveMessage call will wait for a message to arrive (long polling) before returning. An integer from 0 to 20 (seconds) | `number` | `0` | no |
| <a name="input_redrive_policy"></a> [redrive\_policy](#input\_redrive\_policy) | The JSON policy to set up the Dead Letter Queue, see AWS docs. Note: when specifying maxReceiveCount, you must specify it as an integer (5), and not a string ("5") | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to all resources | `map(string)` | `{}` | no |
| <a name="input_visibility_timeout_seconds"></a> [visibility\_timeout\_seconds](#input\_visibility\_timeout\_seconds) | The visibility timeout for the queue. An integer from 0 to 43200 (12 hours) | `number` | `30` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sqs_queue_arn"></a> [sqs\_queue\_arn](#output\_sqs\_queue\_arn) | The ARN of the SQS queue |
| <a name="output_sqs_queue_id"></a> [sqs\_queue\_id](#output\_sqs\_queue\_id) | The URL for the created Amazon SQS queue |
| <a name="output_sqs_queue_tags_all"></a> [sqs\_queue\_tags\_all](#output\_sqs\_queue\_tags\_all) | A map of tags assigned to the resource, including those inherited from the provider `default_tags` configuration block. |
| <a name="output_sqs_queue_url"></a> [sqs\_queue\_url](#output\_sqs\_queue\_url) | Same as `id`: The URL for the created Amazon SQS queue. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## License

See LICENSE for full details.

## Pre-commit hooks

### Install dependencies

* [`pre-commit`](https://pre-commit.com/#install)
* [`terraform-docs`](https://github.com/segmentio/terraform-docs) required for `terraform_docs` hooks.
* [`TFLint`](https://github.com/terraform-linters/tflint) required for `terraform_tflint` hook.

#### MacOS

```bash
brew install pre-commit terraform-docs tflint

brew tap git-chglog/git-chglog
brew install git-chglog
```