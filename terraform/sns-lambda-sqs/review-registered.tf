provider "aws" {
  region = "ap-northeast-1"  # Set your desired AWS region
}

# Create SNS Topic
resource "aws_sns_topic" "review_registered" {
  name = "review_registered"
}

# Create Lambda Function
resource "aws_lambda_function" "review_handler" {
  filename      = "path/to/your/lambda/function.zip"  # Set the path to your Lambda function code
  function_name = "ReviewHandlerFunction"
  role          = aws_iam_role.lambda_execution_role.arn
  handler       = "index.handler"
  runtime       = "nodejs14.x"  # Set the runtime based on your Lambda function's requirements

  environment {
    variables = {
      NOTIFICATION_QUEUE = aws_sqs_queue.notification_queue.id,
      STORE_QUEUE        = aws_sqs_queue.store_queue.id,
      ORDER_QUEUE        = aws_sqs_queue.order_queue.id,
    }
  }

  depends_on = [aws_sns_topic_subscription.lambda_subscription]
}

# Create IAM Role for Lambda Execution
resource "aws_iam_role" "lambda_execution_role" {
  name = "LambdaExecutionRole"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

# Subscribe Lambda Function to SNS Topic
resource "aws_sns_topic_subscription" "lambda_subscription" {
  topic_arn = aws_sns_topic.review_registered.arn
  protocol  = "lambda"
  endpoint  = aws_lambda_function.review_handler.arn
}

# Create SQS Queues
resource "aws_sqs_queue" "notification_queue" {
  name = "notification_queue"
}

resource "aws_sqs_queue" "store_queue" {
  name = "store_queue"
}

resource "aws_sqs_queue" "order_queue" {
  name = "order_queue"
}

# Lambda Permission to Publish to SQS Queues
resource "aws_lambda_permission" "publish_to_notification" {
  statement_id  = "AllowExecutionToNotificationQueue"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.review_handler.function_name
  principal     = "sns.amazonaws.com"

  source_arn = aws_sns_topic.review_registered.arn
}

resource "aws_lambda_permission" "publish_to_store" {
  statement_id  = "AllowExecutionToStoreQueue"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.review_handler.function_name
  principal     = "sns.amazonaws.com"

  source_arn = aws_sns_topic.review_registered.arn
}

resource "aws_lambda_permission" "publish_to_order" {
  statement_id  = "AllowExecutionToOrderQueue"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.review_handler.function_name
  principal     = "sns.amazonaws.com"

  source_arn = aws_sns_topic.review_registered.arn
}
