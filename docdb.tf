
resource "aws_db_subnet_group" "docdb_subnet_group" {
  name       = "robot-${var.ENV}-docdb_subnet_group"
  subnet_ids = data.terraform_remote_state.vpc.outputs.PRIVATE_SUBNET_IDS

  tags = {
    Name = "robot-${var.ENV}-docdb-subnet-group"
  }
}


output "output_ref"{
  value = data.terraform_remote_state.vpc
}

