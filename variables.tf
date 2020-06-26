variable "context" {
  description = "Configuration context like project's name, organization, abbreviation.."
  type        = string
}

variable "stage" {
  description = "Production, staging, uat, dev, ..."
  type        = string
}

variable "additional_tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags"
}

variable "delimiter" {
  type        = string
  description = "Delimiter to be used between `context`, `stage`"
  default     = "-"
}

variable "default_management_value" {
  description = "Default value for management label"
  type        = string
  default     = "managed-by-terraform"
}



