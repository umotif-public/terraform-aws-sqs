resource "aws_sqs_queue" "main" {
  name        = var.name
  name_prefix = var.name_prefix

  visibility_timeout_seconds = var.visibility_timeout_seconds
  message_retention_seconds  = var.message_retention_seconds
  max_message_size           = var.max_message_size
  delay_seconds              = var.delay_seconds
  receive_wait_time_seconds  = var.receive_wait_time_seconds

  policy         = var.policy
  redrive_policy = var.redrive_policy

  fifo_queue            = var.fifo_queue
  fifo_throughput_limit = var.fifo_throughput_limit

  content_based_deduplication = var.content_based_deduplication
  deduplication_scope         = var.deduplication_scope

  kms_master_key_id                 = var.kms_master_key_id
  kms_data_key_reuse_period_seconds = var.kms_data_key_reuse_period_seconds

  tags = var.tags
}
