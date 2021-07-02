variable "bento4_version" {
  default = "v1.6.0-638"
}

variable "exhale_version" {
  default = "v1.1.6"
}


group "default" {
  targets = ["bento4", "exhale", "ffmpeg"]
}

target "bento4" {
  context   = "bento4"
  tags      = ["docker.io/calebdoxsey/bento4:${bento4_version}"]
  platforms = ["linux/amd64", "linux/arm64"]
  args = {
    BENTO4_VERSION = "${bento4_version}"
  }
}

target "exhale" {
  context   = "exhale"
  tags      = ["docker.io/calebdoxsey/exhale:${exhale_version}"]
  platforms = ["linux/amd64", "linux/arm64"]
  args = {
    EXHALE_VERSION = "${exhale_version}"
  }
}

target "ffmpeg" {
  context   = "ffmpeg"
  tags      = ["docker.io/calebdoxsey/ffmpeg:latest"]
  platforms = ["linux/amd64", "linux/arm64"]
}
