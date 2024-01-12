output ip_private {
    value       = aws_instance.my_instance.private_ip
    description = "IP private EC2"
}

output ip_public {
    value       = aws_instance.my_instance.public_ip
    sensitive   = true
    description = "IP public EC2"
}
