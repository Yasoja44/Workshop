resource "oci_identity_compartment" "Compartment2" {
    # Required
    compartment_id = "ocid1.tenancy.oc1..aaaaaaaayvwhvojkagotuif5tvisxlhrwy43lknbcj5x5tx6h72rmcf77a2a"
    description = "Compartment for Terraform resources."
    name = "Compartment2"
}