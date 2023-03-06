variable "azure_location" {
  description = "Store location of Azure to create resources"
  type        = string
  default     = "east us"
}

variable "azure_acc_tier" {
  description = "Store Azure account tier"
  type        = string
  default     = "Standard"
}

variable "azure_acc_repl" {
  description = "Storage Azure account replication type"
  type        = string
  default     = "LRS"
}