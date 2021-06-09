module "lb-cert" {
  source  = "tfe.gcp.lookout.com/services/lb-cert/gcp"
  version = "PUT VERSION HERE" #eg "0.0.2"

  # insert required variables here
  project_id        = "lke-pprd-image-factory-abcde"
  service_name        = "infosec-test"
  dns_names            = ["infosec-test.flexilis.com","cool.flexilis.net"]
}


resource "google_compute_ssl_certificate" "default" {
  name_prefix = "my-certificate-infsoec-test"
  private_key = module.lb-cert.key
  certificate = module.lb-cert.cert

  lifecycle {
    create_before_destroy = true
  }
}
