# PRUEBA: recursos fuera de la lista de servicios soportados por Governance.
# Con todos los tags: ¿cómo aparece en Estimation?
resource "aws_route53_zone" "prueba" {
  name = "governance-demo.internal"

  tags = {
    Owner       = "equipo-plataforma"
    CostCenter  = "CC-1001"
    Environment = "dev"
  }
}

# Sin CostCenter: ¿lo evalúa la política de tags?
resource "aws_ecr_repository" "prueba" {
  name = "governance-demo-prueba"

  tags = {
    Owner       = "equipo-plataforma"
    Environment = "dev"
  }
}
