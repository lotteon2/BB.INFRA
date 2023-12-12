terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_network" "bb_network" {
  name = "bb_network"
}

resource "docker_image" "zookeeper" {
  name = "wurstmeister/zookeeper:latest"
}
resource "docker_image" "kafka" {
  name = "wurstmeister/kafka:latest"
}

resource "docker_container" "zookeeper" {
  image = docker_image.zookeeper.image_id
  name  = "zookeeper"
  ports {
    internal = 2181
    external = 2181
  }
  networks_advanced {
    name = docker_network.bb_network.name
  }
}


resource "docker_container" "kafka" {
  image = docker_image.kafka.image_id
  name  = "kafka"
  ports {
    internal = 9092
    external = 9092
  }
  #  expose = [9093]

  env = [
    "KAFKA_ADVERTISED_LISTENERS=INSIDE://kafka:9093,OUTSIDE://localhost:9092",
    "KAFKA_LISTENER_SECURITY_PROTOCOL_MAP=INSIDE:PLAINTEXT,OUTSIDE:PLAINTEXT",
    "KAFKA_LISTENERS=INSIDE://0.0.0.0:9093,OUTSIDE://0.0.0.0:9092",
    "KAFKA_INTER_BROKER_LISTENER_NAME=INSIDE",
    "KAFKA_ZOOKEEPER_CONNECT=zookeeper:2181",
    "KAFKA_CREATE_TOPICS=config-topic:1:1"
  ]


  volumes {
    host_path      = "/var/run/docker.sock"
    container_path = "/var/run/docker.sock"
  }

  depends_on = [docker_container.zookeeper]
  networks_advanced {
    name = docker_network.bb_network.name
  }
}
