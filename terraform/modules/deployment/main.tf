data "archive_file" "zip_index" {
  type        = "zip"
  source_dir  = var.site_source_dir
  output_path = "${path.module}/index.zip"
}
