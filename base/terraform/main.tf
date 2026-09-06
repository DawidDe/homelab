provider "incus" {
    generate_client_certificates = true
    accept_remote_certificate = true
    default_remote = "heimdall"

    remote {
        name = "heimdall"
        address = "https://192.168.178.3:8443"
        token = ""
    }
}