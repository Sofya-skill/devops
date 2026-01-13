variable "yandex_token" {
  description = "Токен авторизации Яндекс.Облака (OAuth или API токен)"
  type        = string
  sensitive   = true  
}

variable "cloud_id" {
  description = "ID облака в Яндекс.Облаке"
  type        = string
}

variable "folder_id" {
  description = "ID папки в Яндекс.Облаке, в которой создаются ресурсы"
  type        = string
}
variable "ssh_public_key_path" {
  description = "Путь к SSH публичному ключу"
  default     = "/path/to/public/key.pub"
}

variable "ssh_user" {
  description = "Пользователь для входа"
  default     = "ubuntu"
}

variable "subnet_id" {
  description = "ID подсети для размещения виртуальной машины"
  type        = string
}