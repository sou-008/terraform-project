variable "aws_region" {
  description = "AWS region to deploy the EC2 instance"
  default     = "eu-north-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t3.micro"
}

variable "ami" {
  description = "AMI ID to use for EC2"
  default     = "ami-09a9858973b288bdd"  # Default Ubuntu AMI
}

variable "key_name" {
  description = "The name of the EC2 key pair to use for SSH access"
  type        = string
}