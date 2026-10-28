# PRUEBA AVISO — el web sube a m5.xlarge para que Cost Evaluation falle.
# Cloudability usa este ID de cuenta para aplicar tus precios negociados.
data "aws_caller_identity" "defaultidentity" {}

# AMI más reciente de Amazon Linux 2023.
data "aws_ami" "al2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023*-x86_64"]
  }
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.al2023.id
  instance_type = "m5.xlarge"

  tags = {
    Name        = "web"
    Owner       = "equipo-plataforma"
    CostCenter  = "CC-1001"
    Environment = "dev"
  }
}
