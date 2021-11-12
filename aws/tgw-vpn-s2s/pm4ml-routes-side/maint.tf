variable "transit_gateway_id" {

}

variable "route_table_name" {

}

variable "destination_cidr_block" {

}

data "aws_route_tables" "this" {
    filter {
        name = "tag:Name"
        values = ["${var.route_table_name}*"]
        }
    
/*     filter {
        name = "tag-key"
        values = ["Name"]
   } */

}

resource "aws_route" "this" {
/*   count = length(data.aws_route_tables.this.ids)
  route_table_id            = tolist(data.aws_route_tables.this.ids)[count.index]
  destination_cidr_block    = var.destination_cidr_block
  transit_gateway_id = var.transit_gateway_id */
  for_each = toset(data.aws_route_tables.this.ids)
  route_table_id            = [each.value]
  destination_cidr_block    = var.destination_cidr_block
  transit_gateway_id = var.transit_gateway_id


  depends_on = [
    data.aws_route_tables.this
  ]

  }