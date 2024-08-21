resource "yandex_iam_service_account" "service" {
  folder_id = var.yandex_folder_id
  name      = "bucket-account"
}

resource "yandex_resourcemanager_folder_iam_member" "bucket-editor" {
  folder_id = var.yandex_folder_id
  role      = "storage.editor"
  member    = "serviceAccount:${yandex_iam_service_account.service.id}"
  depends_on = [yandex_iam_service_account.service]
}

resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
  service_account_id = yandex_iam_service_account.service.id
}


resource "yandex_storage_bucket" "imalyshev" {
  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  bucket = "imalyshev"
  acl    = "public-read"
}