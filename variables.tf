variable "region" {
  type        = string
  description = "AWS Region"
  default     = "us-east-2"
}
variable "AWS_ACCESS_KEY_ID" {
  type        = string
  description = "This is the value of AWS_ACCESS_KEY_ID"
  default     = "x---"
}

variable "AWS_SECRET_ACCESS_KEY" {
  type        = string
  description = "This is the value of AWS_SECRET_ACCESS_KEY"
  default     = "x---"
  sensitive   = true
}

variable "AWS_SESSION_TOKEN" {
  type        = string
  description = "This is the value of AWS_SESSION_TOKEN"
  default     = "x---"
  sensitive   = true
}