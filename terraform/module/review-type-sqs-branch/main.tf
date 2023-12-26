provider "aws" {
  region = "ap-northeast-1"
}
module "delivery-review-type-check" {
  source = "./delivery-review-type"
}
module "pickup-subscribe-review-type-check" {
  source = "./pickup-subscribe-review-type"
}
module "subscribe-review" {
  source = "./subscription-review-register"
}