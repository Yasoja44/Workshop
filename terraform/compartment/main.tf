provider "oci" {
    #auth = "InstancePrincipal"
   
   tenancy_ocid = "ocid1.tenancy.oc1..aaaaaaaayvwhvojkagotuif5tvisxlhrwy43lknbcj5x5tx6h72rmcf77a2a"
   user_ocid = "ocid1.user.oc1..aaaaaaaa5yssbsgmh4fa6yeancyavnt7eyra2cqlkybi5foekjcleopaziua"
   private_key_path = "C:/Users/User/Downloads/oracleidentitycloudservice_yasoja44-12-15-12-46.pem"
   private_key_password = ""
   fingerprint = "7a:82:f3:d9:c1:eb:ee:5b:35:62:ee:d4:88:ef:79:e5"
   
   region = "ap-hyderabad-1"
}

resource "oci_core_instance" "oracle_instance" {
    # Required
    availability_domain = "NdZG:AP-HYDERABAD-1-AD-1"
    compartment_id = "ocid1.compartment.oc1..aaaaaaaavmzf6u5fmc3u2zdwbrdpwnw53j5r22rkzkxywm5wdzarpd7bmtna"
    shape = "VM.Standard.E2.1"
    source_details {
        source_id = "ocid1.image.oc1.ap-hyderabad-1.aaaaaaaatdvkubwlttjaepuaoenur46nyicai2futxm4k5nnk6a5ds4a6gkq"
        source_type = "image"
    }

    is_pv_encryption_in_transit_enabled = true

    metadata = {
        ssh_authorized_keys = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC0EInZ+6YHDmMKlkg/3clPk85joym9NqILFPMxWECeDDQFQL7XdES7ooW/w36cBfSQnnK+V1e2gLYxvZ4l4PTTiwuPlQCQa2pl1w1EJu6zzAbYzFo955A7FezVgXFn3OaWOBM7sXiac2+7UkyE7fSUoLTF8G8G05dw1D1DmlyQIROrU34aRbVO6X8m8fFefzahadGA8ytD0pgyysJE8Jq7AH1IK8hju//DYJBctLkGm4AA2GYUXJYvOzkjRA4gFZqy/vA+oET+Zh7btmbbwF99gTy0GpjUhww/e92Mhx42XG6yn6Rj9nTsREm5wsLUmIrVp2QvpvoQbIAdISeVtVonZ1MpDlS/vbCm6rwgPBPgdkUtJ31j2O4bgA2mJ95y+SfZ3ZldFVfHNk0M8ACHi057GVprZq1brAP73XEqrF0dzmQUmv4F45QjhZPHJ12c5ZJdbLWoPVb5NnnTnsqxIrWTA36eqV4VgoPAkxaxgfApHBHg1Hu23h+CWMWrcm3R3IU= user@DESKTOP-M8Q095F"
    }

    create_vnic_details {
        assign_public_ip = true
        subnet_id = "ocid1.subnet.oc1.ap-hyderabad-1.aaaaaaaabgf6u4yktjlmn3yfsptwzf3iisddqwo4wzct2cvq4fdulcnwjlka"
    }
}


output "public-ip-for-compute-instance" {
  value = oci_core_instance.oracle_instance.public_ip
}
