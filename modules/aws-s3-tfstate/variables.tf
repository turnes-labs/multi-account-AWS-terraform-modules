variable "bucket_name" {
  description = " bucket name"
  type        = string
}

variable "tags" {
  type    = map(string)
  default = {}
}


# OPTIONAL
variable "backup_transition_days" {
  description = "Number of days before transitioning backups to a cheaper storage tier."
  type        = number
  default = 30

}

variable "backup_expiration_days" {
  description = "Number of days before permanently deleting noncurrent backups."
  type        = number
  default = 90

  validation {
    condition     = var.backup_expiration_days > var.backup_transition_days
    error_message = "Expiration days must be greater than transition days."
  }

  validation {
    condition     = var.backup_expiration_days >= 30
    error_message = "it's not recomended to delete before 30 days"
  }
}

variable "kms_master_key_id" {
  description = "AWS KMS master key ID used for the SSE-KMS encryption. "
  default     = null
}







