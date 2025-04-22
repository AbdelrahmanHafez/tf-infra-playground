module "generate_random_person_lambda" {
  source = "terraform-aws-modules/lambda/aws"

  function_name = "generate-random-person"
  description   = "Generates a random person information"
  handler       = "index.handler"
  runtime       = "nodejs22.x"

  source_path = "${path.module}/placeholder-lambda"
  publish     = true

  attach_policy_statements = true
  policy_statements = [
    {
      actions   = ["sqs:ReceiveMessage", "sqs:DeleteMessage", "sqs:GetQueueAttributes"]
      resources = [module.generate_random_person_sqs.queue_arn]
    }
  ]

}

module "generate_random_person_sqs" {
  source = "terraform-aws-modules/sqs/aws"

  name = "generate-random-person-queue"

  create_dlq                      = true
  create_dlq_redrive_allow_policy = true
  fifo_queue                      = true
  content_based_deduplication     = true

  visibility_timeout_seconds = 10
  redrive_policy = {
    maxReceiveCount = 3
  }
}

resource "aws_lambda_event_source_mapping" "sqs_to_lambda" {
  event_source_arn = module.generate_random_person_sqs.queue_arn
  function_name    = module.generate_random_person_lambda.lambda_function_arn
  batch_size       = 1
}
