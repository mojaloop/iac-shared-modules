data "external" "get_secret_and_key" {
  program = ["bash", "generateMCMConfigKeySecret.sh"]
  query = {
    # arbitrary map from strings to strings, passed
    # to the external program as the data query.
    host = var.iskm_fqdn
    rest_port = var.iskm_rest_port
    admin_user = var.user
    admin_pass = var.password
    create_service_provider = var.create_service_provider
  }
  working_dir = "${path.module}/scripts"
}