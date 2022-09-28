output "node_k8s_cp_public_ip" {
    value = aws_instance.node_k8s_cp[*].public_ip
}

output "wkl_k8s_cp_public_ip" {
    value = aws_instance.node_k8s_wk[*].public_ip
}