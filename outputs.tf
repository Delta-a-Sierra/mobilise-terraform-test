output "webtier_ips" {
  description = "public ip address' for instance in the web tier"
  value = module.web-instances[*].public_ip
}