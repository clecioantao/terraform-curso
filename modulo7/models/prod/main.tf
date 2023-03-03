module "prod" {
  source = "../infra"
  ambiente = "prod"
  location = "eastus"
}