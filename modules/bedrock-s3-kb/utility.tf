# The following configuration will add a 20-second delay after the IAM policy for the OpenSearch Serverless collection is created
# This is to mitigate issues with connection the OSS host
resource "time_sleep" "policy_attach_sleep" {
  count           = var.is_kb ? 1 : 0
  create_duration = "20s"
  depends_on      = [aws_iam_role_policy.kb_service_role_policy]
}
