provider "oci" {
   #auth = "InstancePrincipal"
   
   tenancy_ocid = "ocid1.tenancy.oc1..aaaaaaaayvwhvojkagotuif5tvisxlhrwy43lknbcj5x5tx6h72rmcf77a2a"
   user_ocid = "ocid1.user.oc1..aaaaaaaa7sgoxvcfywrmpav6jp2uwnrx3qz6d26ngw54njkogqlprtlwxwfq"
   private_key_path = "C:/Users/User/Downloads/oracleidentitycloudservice_yasoja44-12-15-12-46.pem"
   private_key_password = ""
   fingerprint = "7a:82:f3:d9:c1:eb:ee:5b:35:62:ee:d4:88:ef:79:e5"
   
   region = "ap-hyderabad-1"
}

data "oci_identity_availability_domains" "ads" {
  compartment_id = "ocid1.tenancy.oc1..aaaaaaaayvwhvojkagotuif5tvisxlhrwy43lknbcj5x5tx6h72rmcf77a2a"
}

resource "oci_core_vcn" "test_vcn" {
    #Required
    compartment_id = "ocid1.tenancy.oc1..aaaaaaaayvwhvojkagotuif5tvisxlhrwy43lknbcj5x5tx6h72rmcf77a2a"

    #Optional
    cidr_block = "172.16.0.0/24"
    display_name = "My VCN"
    dns_label = "newLabel"
    
}

#terraform init

#terraform plan
#terraform apply

resource "oci_core_subnet" "test_subnet" {
    #Required
    cidr_block = "172.16.0.0/24"
    compartment_id = "ocid1.tenancy.oc1..aaaaaaaayvwhvojkagotuif5tvisxlhrwy43lknbcj5x5tx6h72rmcf77a2a"
    vcn_id = "ocid1.vcn.oc1.ap-hyderabad-1.amaaaaaagltuylaaik6dsdwmplbcsgg56l6qecw3bkqjrwglnzc74gamzsgq"

    #Optional
    display_name = "${var.subnet_display_name}"
    dns_label = "internal"
    prohibit_public_ip_on_vnic = false

}

#terraform plan
#terraform apply


#terraform destroy