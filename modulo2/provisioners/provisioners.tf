resource null_resource "processospowershell" {
    provisioner "local-exec" {
        command = "ls -la > lista.txt"
        interpreter = ["/bin/bash", "-c"]
    }
}