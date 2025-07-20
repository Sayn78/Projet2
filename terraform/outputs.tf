output "instance_ip" {
  value = aws_eip.k8s_eip.public_ip
}

output "ssh_connection" {
  value = "ssh -i ${var.private_key_path} ubuntu@${aws_eip.k8s_eip.public_ip}"
}
