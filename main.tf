# Cria uma VM com o Google Cloud
resource "google_compute_instance" "helloworld" {
  name         = "estagiario"
  machine_type = "f1-micro"
  zone         = var.zone

  # Define a Imagem da VM
  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  # Habilita rede para a VM com um IP público
  network_interface {
    network = "default"
    access_config {
    }
  }

  # Cria o inventário do Ansible
  provisioner "local-exec" {
    command = "echo ${google_compute_instance.helloworld.network_interface.0.access_config.0.nat_ip} > ansible/inventory"
  }

  # Executa a playbook na máquina provisionada
  provisioner "local-exec" {
    command = "ansible-playbook -i ansible/inventory --private-key ~/.ssh/id_rsa ansible/playbook.yml"
  }

}


# Cria SQL Gerenciado com Engine MySQL
resource "google_sql_database_instance" "helloworld" {
  name             = var.dbname
  database_version = "MYSQL_5_7"
  region           = "us-central1"

  settings {
    tier = var.zonedb
  }
}

