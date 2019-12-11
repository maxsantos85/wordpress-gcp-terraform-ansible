# Retorna o IP da VM criada
output "IP_da_VM_PUBLICO" {
  value = "${google_compute_instance.helloworld.network_interface.0.access_config.0.nat_ip}"
}

# Retorna o IP da VM criada
output "IP_da_VM_PRIVADO" {
  value = "${google_compute_instance.helloworld.network_interface.0.network_ip}"
}

# Retorna o tipo da VM criada
output "Machine_Type" {
  value = "${google_compute_instance.helloworld.machine_type}"
}

# Retorna o IP da Database
output "IP_da_Database" {
  value = "${google_sql_database_instance.helloworld.first_ip_address}"
}

