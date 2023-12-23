provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_sns_topic" "new_order_event" {
  name         = "new-order-event"
  display_name = "new order event"
}


resource "aws_sns_topic" "review_register_event" {
  name         = "review-register-event"
  display_name = "review register event"
}

resource "aws_sqs_queue" "review-register-queue" {
  name                       = "review-register-queue"
  delay_seconds              = 0
  max_message_size           = 262144
  message_retention_seconds  = 345600 # 4 days
  visibility_timeout_seconds = 40
  receive_wait_time_seconds  = 10
  redrive_policy             = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.dead_letter_queue.arn
    maxReceiveCount     = 5
  })
}

resource "aws_sqs_queue" "dead_letter_queue" {
  name = "review-register-dead-letter-queue"
}
resource "aws_sqs_queue_policy" "example_queue_policy" {
  queue_url = aws_sqs_queue.review-register-queue.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": "sqs:*",
      "Resource": "${aws_sqs_queue.review-register-queue.arn}"
    }
  ]
}
EOF
}
resource "aws_sns_topic_subscription" "sns_subscription" {
  endpoint  = aws_sqs_queue.review-register-queue.arn
  protocol  = "sqs"
  topic_arn = aws_sns_topic.review_register_event.arn
}