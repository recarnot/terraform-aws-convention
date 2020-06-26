output "context" {
  description = "Formatted 'context' value"
  value       = local.context
}

output "stage" {
  description = "Formatted 'stage' value"
  value       = local.stage
}

output "delimiter" {
  description = "Used delimiter"
  value       = var.delimiter
}

output "prefix" {
  description = "Concatenation between 'context', 'stage' using 'delimiter'"
  value       = local.prefix
}

output "label_formater" {
  description = "Allow to format string using 'prefix', example : format(module.convention.label_formatter, 'my-value')"
  value       = local.label_formatter
}

output "tags" {
  description = "Created tags map"
  value       = local.tags
}

output "availability_zones" {
  description = "AWS Availability Zone informations, .names, .count"
  value = {
    names : data.aws_availability_zones.available.names
    count : length(data.aws_availability_zones.available.names)
  }
}

output "account_id" {
  description = "The AWS Account ID number of the account that owns or contains the calling entit"
  value       = data.aws_caller_identity.current.account_id
}

output "region" {
  description = "Current region informations : .id, .name, .location, .endpoint"
  value = {
    id : data.aws_region.current.name
    name : local.region_name
    location : local.region_location
    ec2_endpoint : data.aws_region.current.endpoint
  }
}

output "billing" {
  description = "Informations about Billing account, .id, .arn"
  value = {
    id  = data.aws_billing_service_account.main.id
    arn = data.aws_billing_service_account.main.arn
  }
  sensitive = true
}
