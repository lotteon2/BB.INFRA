variable "ClusterBaseName" {
  description = "Base name for the EKS cluster"
  type        = string
  default     = "blooming-blooms-eks"
}

# Add other variables as needed

variable "cluster-name" {
  default = "blooming-blooms"
  type    = string
}

