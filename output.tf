output ip_private {
    value       = aws_instance.my_instance.private_ip
    description = "IP private EC2"
}

output ip_public {
    value       = aws_eip.my_eip.public_ip
    sensitive   = true
    description = "IP public EC2 associated with the Elastic IP address"
}

output public_dns {
    value = aws_eip.my_eip.public_dns
    sensitive = true
    description = "Public DNS associated with the Elastic IP address"
}
