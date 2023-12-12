provider "docker" {
  alias = "zookeeper"
}

resource "docker_image" "zookeeper" {
  provider = docker.zookeeper
  name = "wurstmeister/zookeeper"
  # Other image-related configurations
}

resource "docker_container" "zookeeper" {
  name  = "zookeeper"
  image = docker_image.zookeeper
  ports {
    internal = 2181
    external = 2181
  }

  networks = ["bb_network"]
}
