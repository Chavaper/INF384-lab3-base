# Recurso escrito a proposito para demostrar la compuerta de politicas.
# Abre SSH a todo internet: Trivy lo reporta con severidad CRITICAL.
resource "aws_security_group" "demo_ssh_abierto" {
  name        = "inf384-lab3-demo-ssh"
  description = "Demo: SSH abierto a internet"

  ingress {
    description = "SSH desde cualquier origen"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}