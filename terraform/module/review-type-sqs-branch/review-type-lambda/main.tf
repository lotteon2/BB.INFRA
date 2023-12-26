variable "existing_layer_arn" {
  default = "arn:aws:lambda:ap-northeast-1:661371928731:layer:aws-sdk:1"
}

resource "aws_lambda_function" "review-type-check" {
  function_name    = "review-type-check"
  runtime          = "nodejs18.x"  # Replace with your desired runtime
  handler          = "index.handler"
  filename         = "/Users/nowgnas/lotteon/javascript.zip"  # Path to your Lambda function code ZIP file
  source_code_hash = filebase64("/Users/nowgnas/lotteon/javascript.zip")
  layers           = [var.existing_layer_arn]
  role             = aws_iam_role.lambda_exec_role.arn
}

resource "aws_iam_role" "lambda_exec_role" {
  name = "lambda-exec-role"

  assume_role_policy = jsonencode({
    Version   = "2012-10-17",
    Statement = [
      {
        Action    = "sts:AssumeRole",
        Effect    = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com",
        },
      }
    ],
  })
}
resource "aws_sns_topic_subscription" "sns_subscribe" {
  endpoint  = aws_lambda_function.review-type-check.arn
  protocol  = "lambda"
  topic_arn = "arn:aws:sns:ap-northeast-1:661371928731:new_order_event"
}
output "sale-count-queue-arn" {
  value = aws_lambda_function.review-type-check.arn
}
