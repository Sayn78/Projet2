output "instance_ip" {
  value = aws_instance.k8s_node.public_ip
}

output "ssh_connection" {
  value = "ssh -i ${var.private_key_path} ubuntu@${aws_instance.k8s_node.public_ip}"
}
