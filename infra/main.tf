# Cloudability usa este ID de cuenta para aplicar tus precios negociados.
# CAMBIO 4
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

# CAMBIO 1: el servidor web sube de t3.micro a m5.large.
resource "aws_instance" "web" {
  ami           = data.aws_ami.al2023.id
  instance_type = "m5.large"

  tags = {
    Name        = "web"
    Owner       = "equipo-plataforma"
    CostCenter  = "CC-2040"
    Environment = "dev"
  }
}

# CAMBIO 2: dos servidores de aplicación nuevos... sin CostCenter.
resource "aws_instance" "app" {
  count         = 2
  ami           = data.aws_ami.al2023.id
  instance_type = "t3.micro"

  tags = {
    Name        = "app-${count.index}"
    Owner       = "equipo-pagos"
    CostCenter  = "CC-2040"
    Environment = "dev"
  }
}
