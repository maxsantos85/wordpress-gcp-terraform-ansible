# Configura o Provider Google Cloud com o Projeto
provider "google" {
  credentials = file("/vagrant/turma03-infraagil-3481cc6af0f8.json")
  project     = var.projectid
  region      = "us-central1"
}
