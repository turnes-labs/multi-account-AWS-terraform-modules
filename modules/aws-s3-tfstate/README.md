# AWS S3 Terraform state module

* S3 Account regional namespaces
  * bucket name `tf-state` on region `us-east-1` will result in: `tf-state-123456789012-us-east-1-an`
* Storage Class Standard
* Bucket Version enabled
* Bucket Lifecyle enabled
  * after 30 days migrates to cheaper storage (S3 Standard-IA)
  * after 90 days deletes permanently
* Encription
  * SSE-KMS with the AWS-managed key by default
  * Use `kms_master_key_id` to use your own KMS Key

S3 Standard-IA

* Infrequently accessed data that needs millisecond access
* Same low latency and high throughput performance of S3 Standard
* Designed to deliver 99.9% availability with an availability SLA of 99%
