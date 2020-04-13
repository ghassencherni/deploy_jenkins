#----ec2_instances/outputs.tf----

## kubernetes Master outputs
#output "kubernetes_master_node_id" {
#  value = "${aws_instance.kubernetes_master.id}"
#}
#
#output "kubernetes_master_node_ip" {
#  value = "${aws_instance.kubernetes_master.public_ip}"
#}
#
## Kubernetes Worker Nodes outputs
#output "kubernetes_worker_node_id" {
#  value = "${join(", ", aws_instance.kubernetes_node.*.id)}"
#}
#
#output "kubernetes_worker_node_ip" {
#  value = "${join(", ", aws_instance.kubernetes_node.*.public_ip)}"
#}

output "jenkins_public_ip" {
   value ="${aws_instance.jenkins_instance.public_ip}"
}

resource "local_file" "ansible_hosts" {
  content = <<HOSTS
[nodes]
${aws_instance.jenkins_instance.public_ip} ansible_ssh_private_key_file=${var.private_key_path}
HOSTS

filename = "hosts.ini"
file_permission = "600"

}
