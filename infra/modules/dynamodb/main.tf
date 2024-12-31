resource "aws_dynamodb_table" "tf_notes_table" {
 name = var.name
 billing_mode = var.billing_mode
 read_capacity= var.read_capacity
 write_capacity= var.write_capacity
 dynamic "attribute" {
   for_each = length(var.attributes) > 0 ? var.attributes : []
   content {
     name = attribute.value.name
     type = attribute.value.type
   }
 }
 hash_key = var.hash_key
 range_key = var.range_key
 tags = var.tags
}