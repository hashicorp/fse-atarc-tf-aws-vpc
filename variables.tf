variable "region" {
  type        = string
  description = "AWS Region"
  default     = "us-east-2"
}
variable "access_key" {
  type        = string
  description = "This is the value of AWS_ACCESS_KEY_ID"
  default     = "x---"
}

variable "secret_key" {
  type        = string
  description = "This is the value of AWS_SECRET_ACCESS_KEY"
  default     = "x---"
  sensitive   = true
}
