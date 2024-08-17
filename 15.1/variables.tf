variable "yandex_cloud_id" {
  default = "cloud-id"
}

variable "yandex_folder_id" {
  default = "folder-id"
}

variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "os" {
  description = "Ubuntu 22 image ID"
  default = "fd8unsmfpl9uk01uodf2"
}

variable "nat-os" {
  default = "fd80mrhj8fl2oe87o4e1"
}

variable "nat-ip" {
  default = "192.168.10.254"
}