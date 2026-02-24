output "vpc_id" {
  value = aws_vpc.aircanada_vpc.id
}

output "vpc_arn" {
  value = aws_vpc.aircanada_vpc.arn
}

output "dhcp_options_id" {
  value = aws_vpc.aircanada_vpc.dhcp_options_id
}