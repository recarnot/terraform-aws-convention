locals {
  regex_chars = "/[^a-zA-Z0-9-]/"

  context         = lower(replace(var.context, local.regex_chars, ""))
  stage           = lower(replace(var.stage, local.regex_chars, ""))
  prefix          = join(var.delimiter, [local.context, local.stage])
  label_formatter = format("%s%%s", format("%s%s", join(var.delimiter, [local.context, local.stage]), var.delimiter))
  region_location = lower(split(" ", data.aws_region.current.description)[0])
  region_name     = lower(replace(split(" ", data.aws_region.current.description)[1], local.regex_chars, ""))

  tags = merge(
    var.additional_tags,
    {
      context : local.context
      location : local.region_location
      management : var.default_management_value
      region : local.region_name
      stage : local.stage
    }
  )
}




