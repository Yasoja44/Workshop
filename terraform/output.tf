###known after apply outputs

output "vcn_cidr" {
	description = "CIDR block of the core VCN"
	value = oci_core_vcn.test_vcn.cidr_block
}

#terraform output