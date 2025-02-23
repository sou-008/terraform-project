provider "aws" {
  region = "eu-north-1"  # Change this to your preferred region
}

# Security Group Configuration
resource "aws_security_group" "flask_express_sg" {
  name        = "flask-express-sg"
  description = "Allow traffic to Flask and Express apps"
  
  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 Instance Configuration
resource "aws_instance" "flask_express_instance" {
  ami           = "ami-09a9858973b288bdd"  # Example Ubuntu AMI, choose the right one for your region
  instance_type = "t3.micro"  # Free-tier eligible instance type
  key_name      = "terraform-key-pair"  # Replace with your EC2 key pair name
  
  security_groups = ["${aws_security_group.flask_express_sg.name}"]

  # User Data Script to install dependencies and start apps
  user_data = file("user_data.sh")

  tags = {
    Name = "FlaskExpressEC2"
  }

  # Enable the EC2 instance to be accessible via the public IP
  associate_public_ip_address = true
}
