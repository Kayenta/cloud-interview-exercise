resource "aws_dynamodb_table" "currencies" {
  name = "interview-exercise-currencies"

  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "code"

  attribute {
    name = "code"
    type = "S"
  }
}

resource "aws_dynamodb_table_item" "items" {
  for_each = toset([
    "eur",
    "gbp",
    "hkd",
    "usd"
  ])

  table_name = aws_dynamodb_table.currencies.name
  hash_key   = aws_dynamodb_table.currencies.hash_key

  item = file("${path.module}/table_items/${each.key}.json")
}
