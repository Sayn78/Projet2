provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "k8s_node" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  associate_public_ip_address = true

  tags = {
    Name = "Projet2-K8S-Node"
  }

  provisioner "remote-exec" {
    inline = ["echo Hello from Terraform"]
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.private_key_path)
      host        = self.public_ip
    }
  }
}
