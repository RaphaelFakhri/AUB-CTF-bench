group "default" {
  targets = ["full"]
}

variable "TAG" {
  default = "latest"
}

variable "REGISTRY" {
  default = "aub-ctf-bench"
}

target "base" {
  dockerfile = "Dockerfile"
  target = "base"
  platforms = ["linux/amd64", "linux/arm64"]
  tags = ["${REGISTRY}/kali-linux:${TAG}-base"]
  args = {
    INSTALL_NET_RECON = "false"
    INSTALL_WEB_TESTING = "false"
    INSTALL_BRUTE_FORCE = "false"
    INSTALL_EXPLOITATION = "false"
    INSTALL_POST_EXPLOITATION = "false"
    INSTALL_CRYPTO = "false"
    INSTALL_TRAFFIC_ANALYSIS = "false"
    INSTALL_TUNNELING = "false"
    INSTALL_LDAP_AD = "false"
    INSTALL_DATABASES = "false"
    INSTALL_REVERSING = "false"
    INSTALL_MISC_TOOLS = "false"
    INSTALL_PYTHON = "false"
    INSTALL_BUILD_TOOLS = "false"
    INSTALL_NET_UTILS = "false"
    INSTALL_ARCHIVES = "false"
    INSTALL_DOCKER_CLI = "false"
    INSTALL_GO = "false"
    INSTALL_GO_TOOLS = "false"
  }
}

target "net" {
  dockerfile = "Dockerfile"
  target = "base"
  platforms = ["linux/amd64", "linux/arm64"]
  tags = ["${REGISTRY}/kali-linux:${TAG}-net"]
  args = {
    INSTALL_NET_RECON = "true"
    INSTALL_WEB_TESTING = "true"
    INSTALL_BRUTE_FORCE = "true"
    INSTALL_EXPLOITATION = "false"
    INSTALL_POST_EXPLOITATION = "false"
    INSTALL_CRYPTO = "false"
    INSTALL_TRAFFIC_ANALYSIS = "true"
    INSTALL_TUNNELING = "true"
    INSTALL_LDAP_AD = "false"
    INSTALL_DATABASES = "false"
    INSTALL_REVERSING = "false"
    INSTALL_MISC_TOOLS = "false"
    INSTALL_PYTHON = "true"
    INSTALL_BUILD_TOOLS = "true"
    INSTALL_NET_UTILS = "true"
    INSTALL_ARCHIVES = "true"
    INSTALL_DOCKER_CLI = "false"
    INSTALL_GO = "true"
    INSTALL_GO_TOOLS = "true"
  }
}

target "full" {
  dockerfile = "Dockerfile"
  target = "base"
  platforms = ["linux/amd64", "linux/arm64"]
  tags = ["${REGISTRY}/kali-linux:${TAG}-full"]
  args = {
    INSTALL_NET_RECON = "true"
    INSTALL_WEB_TESTING = "true"
    INSTALL_BRUTE_FORCE = "true"
    INSTALL_EXPLOITATION = "true"
    INSTALL_POST_EXPLOITATION = "true"
    INSTALL_CRYPTO = "true"
    INSTALL_TRAFFIC_ANALYSIS = "true"
    INSTALL_TUNNELING = "true"
    INSTALL_LDAP_AD = "true"
    INSTALL_DATABASES = "true"
    INSTALL_REVERSING = "true"
    INSTALL_MISC_TOOLS = "true"
    INSTALL_PYTHON = "true"
    INSTALL_BUILD_TOOLS = "true"
    INSTALL_NET_UTILS = "true"
    INSTALL_ARCHIVES = "true"
    INSTALL_DOCKER_CLI = "true"
    INSTALL_GO = "true"
    INSTALL_GO_TOOLS = "true"
  }
}

target "systemd" {
  dockerfile = "Dockerfile"
  target = "systemd"
  platforms = ["linux/amd64", "linux/arm64"]
  tags = ["${REGISTRY}/kali-linux:${TAG}-systemd"]
  contexts = {
    base = "target:full"
  }
}

target "full-local" {
  inherits = ["full"]
  platforms = []
}
