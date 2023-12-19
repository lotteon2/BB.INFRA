provider "aws" {
  region = "ap-northeast-1"  # Change this to your desired region
}

# Create SNS Topic
resource "aws_sns_topic" "card_register_event" {
  name = "card-register-event"
}

# Create Lambda Function
resource "aws_lambda_function" "subscribe_sns_lambda" {
  filename      = "path/to/your/lambda.zip"  # Change this to the path of your Lambda deployment package
  function_name = "subscribe-sns-lambda"
  role          = aws_iam_role.lambda_execution_role.arn
  handler       = "your.package.YourLambdaHandler"  # Change this to your Lambda handler
  runtime       = "java11"

  environment {
    variables = {
      SNS_TOPIC_ARN = aws_sns_topic.card_register_event.arn
    }
  }

  depends_on = [aws_sns_topic.card_register_event]
}

# Create IAM Role for Lambda Execution
resource "aws_iam_role" "lambda_execution_role" {
  name = "lambda_execution_role"

  assume_role_policy = jsonencode({
    Version   = "2012-10-17",
    Statement = [
      {
        Action    = "sts:AssumeRole",
        Effect    = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

# Attach Policy to IAM Role
resource "aws_iam_role_policy_attachment" "lambda_execution_role_policy_attachment" {
  policy_arn = "arn:aws:iam::aws:policy/AWSLambdaFullAccess"  # Change this to the desired policy
  role       = aws_iam_role.lambda_execution_role.name
}

# Create SQS Queues
resource "aws_sqs_queue" "order_history_queue" {
  name = "card-is-register-for-order-history-queue"
}

resource "aws_sqs_queue" "pickup_status_queue" {
  name = "pickup-card-status-queue"
}

