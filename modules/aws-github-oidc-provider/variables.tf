variable "region" {
  description = "AWS Region"
  type        = string

  default = null
}

variable "thumbprint_list" {
  description = "List of OIDC provider certificate thumbprints"
  type = list(string)
  default = [ "ab9d0263244dd0326eb67015705a667e79cfe998" ]
}