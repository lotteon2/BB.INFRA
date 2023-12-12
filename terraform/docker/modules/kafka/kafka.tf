resource "docker_image" "zookeeper" {
  provider = docker.zookeeper
  name     = "wurstmeister/zookeeper"
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


resource "docker_image" "kafka" {
  provider = docker.kafka
  name     = "wurstmeister/kafka"
}

resource "docker_container" "kafka" {
  name  = "kafka"
  image = docker_image.kafka
  ports {
    internal = 9092
    external = 9092
  }
  expose = [9093]

  environment = {
    KAFKA_ADVERTISED_LISTENERS           = "INSIDE://kafka:9093,OUTSIDE://localhost:9092"
    KAFKA_LISTENER_SECURITY_PROTOCOL_MAP = "INSIDE:PLAINTEXT,OUTSIDE:PLAINTEXT"
    KAFKA_LISTENERS                      = "INSIDE://0.0.0.0:9093,OUTSIDE://0.0.0.0:9092"
    KAFKA_INTER_BROKER_LISTENER_NAME     = "INSIDE"
    KAFKA_ZOOKEEPER_CONNECT              = "zookeeper:2181"
    KAFKA_CREATE_TOPICS                  = "config-topic:1:1"
  }

  volumes {
    host_path      = "/var/run/docker.sock"
    container_path = "/var/run/docker.sock"
  }

  depends_on = [docker_container.zookeeper]

  networks = ["bb_network"]
}
