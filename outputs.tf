output "instance_public_ip" {
  value = aws_instance.flask_express_instance.public_ip
}