variable "project_name" {
  description = "Prefix for all resource names"
  type        = string
  default     = "fastapi-ci"
}

variable "image_tag" {
  description = "Tag of the locally built image"
  type        = string
  default     = "local"
}

variable "external_port" {
  description = "Host port that maps to port 8000 in the container"
  type        = number
  default     = 8080

  validation {
    condition     = var.external_port >= 1024 && var.external_port <= 65535
    error_message = "external_port must be between 1024 and 65535."
  }
}

variable "docker_host" {
  description = "Docker daemon address. Windows Docker Desktop: npipe. Linux/macOS: unix:///var/run/docker.sock"
  type        = string
  default     = "npipe:////./pipe/docker_engine"
}
