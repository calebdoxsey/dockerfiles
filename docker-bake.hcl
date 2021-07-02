variable "exhale_version" {
  default = "v1.1.6"
}

group "default" {
  targets = ["exhale"]
}

target "exhale" {
  context = "exhale"
  tags    = ["docker.io/calebdoxsey/exhale:${exhale_version}"]
  args = {
    EXHALE_VERSION = "${exhale_version}"
  }
}
