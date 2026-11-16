output "container_name" {
  description = "Name of the running container"
  value       = docker_container.app.name
}

output "network_name" {
  description = "Name of the Docker network"
  value       = docker_network.app.name
}

output "healthcheck_url" {
  description = "URL to verify the API"
  value       = "http://localhost:${var.external_port}/common/healthcheck"
}
