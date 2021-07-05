provider "aws" {
  region = "eu-west-1"
}

#####
# Main SQS queue
#####
module "sqs" {
  source = "../../"

  name_prefix = "core-sqs-example-"

  fifo_queue            = true
  fifo_throughput_limit = "perMessageGroupId"

  content_based_deduplication = true
  deduplication_scope         = "messageGroup"

  kms_master_key_id = "alias/aws/sqs"

  redrive_policy = jsonencode(
    {
      deadLetterTargetArn = module.sqs-dlq.sqs_queue_arn
      maxReceiveCount     = 3
    }
  )

  tags = {
    Type    = "main-queue"
    Project = "Test"
  }
}

module "sqs-dlq" {
  source = "../../"

  name_prefix = "core-sqs-dlq-example-"

  fifo_queue            = true
  fifo_throughput_limit = "perMessageGroupId"

  content_based_deduplication = true
  deduplication_scope         = "messageGroup"

  kms_master_key_id = "alias/aws/sqs"

  tags = {
    Type    = "main-dlq"
    Project = "Test"
  }
}
