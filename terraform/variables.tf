variable "aws_region" {
  description = "AWS region to deploy to"
  default     = "us-east-1"
}

variable "key_pair_name" {
  description = "Name of the AWS key pair for SSH access"
  type        = string
}

variable "my_ip" {
  description = "Your home IP address for SSH access"
  type        = string
}