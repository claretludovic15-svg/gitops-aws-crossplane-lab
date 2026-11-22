variable "aws_region" {
  description = "AWS region for foundation resources"
  type        = string
  default     = "eu-west-3"
}

variable "project_name" {
  description = "Project prefix for tagging and naming"
  type        = string
  default     = "gitops-aws-crossplane-lab"
}
