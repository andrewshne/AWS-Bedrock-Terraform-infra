resource "local_file" "s3_bucket_op" {
  content  = module.ds_bucket.s3_bucket_id
  filename = "data/extracted_s3_bucket_name.txt"
}

resource "local_file" "oss_id_op" {
  content  = module.bedrock.kb_id
  filename = "data/extracted_kb_id.txt"
}
