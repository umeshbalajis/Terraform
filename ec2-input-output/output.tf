output "ubuntu_id" {
    value = aws_instance.ubuntu.id
}

output "ubuntu_public-ip" {
    value = aws_instance.ubuntu.public_ip
}

output "ubuntu_private-ip" {
    value = aws_instance.ubuntu.private_ip
}

output "ubuntu_status" {
    value = aws_instance.ubuntu.instance_state
}

