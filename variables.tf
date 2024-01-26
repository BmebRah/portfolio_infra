variable "availability_zones" {
  description = "Availability zones"
  default     = ["eu-west-2a", "eu-west-2c"]
}

variable "region" {
  default = "eu-west-2"
}

variable "ecs_prod_backend_retention_days" {
  description = "Retention period for backend logs"
  default     = 30
}
