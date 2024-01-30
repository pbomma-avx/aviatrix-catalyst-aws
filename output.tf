output "hostname" {
  value = aws_instance.CatalystOnprem.*.tags[0]
}
output "public_ip" {
  value = aws_eip.catalyst_public_eip.*.public_ip
}
output "ssh_cmd_catalyst" {
  value = var.key_name == null ? [for ip in aws_eip.catalyst_public_eip.*.public_ip : "ssh -i ${var.hostname}-key.pem ec2-user@${ip}"] : [for ip in aws_eip.catalyst_public_eip.*.public_ip : "ssh -i ${var.key_name}.pem ec2-user@${ip}"]
}
output "ssh_cmd_client" {
  value = var.key_name == null ? [for ip in aws_eip.catalyst_public_eip.*.public_ip : "ssh -i ${var.hostname}-key.pem ubuntu@${ip} -p 2222"] : [for ip in aws_eip.catalyst_public_eip.*.public_ip : "ssh -i ${var.key_name}.pem ubuntu@${ip} -p 2222"]
}
output "user_data" {
  value = [for config in data.aws_instance.CatalystOnprem.*.user_data_base64 : base64decode(config)]
}
