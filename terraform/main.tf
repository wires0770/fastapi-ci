resource "docker_network" "app" {
  name = "${var.project_name}-net"
}

data "docker_image" "app" {
  name = "${var.project_name}:${var.image_tag}"
}

resource "docker_container" "app" {
  name    = "${var.project_name}-app"
  image   = data.docker_image.app.id
  restart = "unless-stopped"

  ports {
    internal = 8000
    external = var.external_port
  }

  networks_advanced {
    name = docker_network.app.name
  }

  healthcheck {
    test     = ["CMD", "python", "-c", "import urllib.request; urllib.request.urlopen('http://localhost:8000/common/healthcheck')"]
    interval = "10s"
    timeout  = "3s"
    retries  = 3
  }
}
