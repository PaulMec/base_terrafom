resource "null_resource" "create_container_app" {
  provisioner "local-exec" {
    command = <<-EOT
      az containerapp up --name ${var.name} --image ${var.image} --resource-group ${var.rg-name} --environment ${var.container_app_environment_name} --ingress external --target-port 80
    EOT
  }
}
