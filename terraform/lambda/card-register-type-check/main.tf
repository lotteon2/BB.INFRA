provider "aws" {
  region = "ap-northeast-1"  # Replace with your desired AWS region
}

resource "aws_lambda_function" "card-register-type-check" {
  function_name = "card-register-type-check"
  runtime       = "nodejs14.x"  # Replace with your desired runtime
  handler       = "index.handler"
  filename      = "/Users/nowgnas/lotteon/javascript.zip"  # Path to your Lambda function code ZIP file
  source_code_hash = filebase64("/Users/nowgnas/lotteon/javascript.zip")

  role          = aws_iam_role.lambda_exec_role.arn
}

resource "aws_iam_role" "lambda_exec_role" {
  name = "lambda-exec-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "lambda.amazonaws.com",
      },
    }],
  })
}
resource "aws_sns_topic_subscription" "sns_subscribe" {
  endpoint  = aws_lambda_function.card-register-type-check.arn
  protocol  = "lambda"
  topic_arn = "arn:aws:sns:ap-northeast-1:661371928731:card-register-event"
}