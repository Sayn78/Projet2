provider "aws" {
  region = var.aws_region
}

# Security Group
resource "aws_security_group" "ssh_web" {
  name        = "Projet2-SG"
  description = "Allow Kubernetes, SSH, NodePort and HTTP"
  vpc_id      = aws_vpc.main_vpc.id

  # SSH
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Kubernetes API Server
  ingress {
    from_port   = 6443
    to_port     = 6443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # NodePort (application Kubernetes exposée)
  ingress {
    from_port   = 30000
    to_port     = 32767
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Kubernetes internal components (scheduler, controller, etc.)
  ingress {
    from_port   = 10250
    to_port     = 10259
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # DNS (si CoreDNS en UDP)
  ingress {
    from_port   = 53
    to_port     = 53
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Sortie autorisée
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Projet2-SG"
  }
}


# Instance EC2
resource "aws_instance" "k8s_node" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = aws_subnet.main_subnet.id
  vpc_security_group_ids      = [aws_security_group.ssh_web.id]
  associate_public_ip_address = true

  tags = {
    Name = "Projet2-EC2"
  }


  provisioner "remote-exec" {
    inline = ["echo Instance up!"]
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.private_key_path)
      host        = self.public_ip
    }
  }
}

# Créer une Elastic IP
resource "aws_eip" "k8s_eip" {
  instance = aws_instance.k8s_node.id

  tags = {
    Name = "Projet2-EIP"
  }
}
