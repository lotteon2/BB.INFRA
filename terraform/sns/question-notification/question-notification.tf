provider "aws" {
  region = "ap-northeast-1"  # Update with your desired AWS region
}

resource "aws_sns_topic" "question-notification" {
  name         = "question-notification"
  display_name = "Question Notification"
}
