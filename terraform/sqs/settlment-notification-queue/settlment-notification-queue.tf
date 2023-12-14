provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_sqs_queue" "settlement-notification-queue" {
  name                       = "settlement-notification-queue"
  delay_seconds              = 0
  max_message_size           = 262144
  message_retention_seconds  = 345600
  visibility_timeout_seconds = 40
  receive_wait_time_seconds  = 10
  redrive_policy             = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.dead_letter_queue.arn
    maxReceiveCount     = 5
  })
}

resource "aws_sqs_queue" "dead_letter_queue" {
  name = "settlement-notification-dead-letter-queue"
}
