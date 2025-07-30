resource "aws_security_group" "eks_nodes" {
  name        = "eks-nodes-sg"
  description = "Security Group for EKS Worker Nodes"
  vpc_id      = aws_vpc.main_vpc.id

  # SSH depuis TON IP uniquement
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["TON_IP_PUBLIC/32"]
  }

  # Communication avec le Control Plane (EKS <-> nodes)
  ingress {
    from_port   = 1025
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # NodePort range
  ingress {
    from_port   = 30000
    to_port     = 32767
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP pour accéder à une app Web (optionnel)
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # DNS interne (CoreDNS)
  ingress {
    from_port   = 53
    to_port     = 53
    protocol    = "udp"
    cidr_blocks = ["10.0.0.0/16"] # ton CIDR VPC
  }

  # Sortie autorisée
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "EKS-WorkerNodes"
  }
}
