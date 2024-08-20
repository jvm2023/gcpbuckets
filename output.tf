output "bucketsinfo" {
  description = "buckets with thier corresponding location"
  value       = { for bu in google_storage_bucket.buckets : bu.name => bu.location }

}


output "listofbucketsid" {
  description = "listofbucketsids"
  value = [for buc in google_storage_bucket.buckets: buc.id]

  
}


