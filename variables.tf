variable "enabled" {
  description = "Set to false to prevent the module from creating any resources"
  type        = bool
  default     = true
}

variable "name" {
  description = "Name of the IAM user"
  type        = string
}

variable "path" {
  description = "Path of the IAM user"
  default     = "/"
  type        = string
}
variable "attach_policy_arns" {
  description = "Existing policy ARNs to attach to the IAM user"
  type        = list(string)
 
}

variable "tags" {
  description = "Tags applied to all resources"
  type        = map(string)
  default     = {}
}
