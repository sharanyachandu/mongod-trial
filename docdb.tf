
resource "aws_docdb_cluster" "docdb" {
  engine                    = "docdb"
  cluster_identifier        = "robot-${var.ENV}-docdb"
  master_username           = "centos"
  master_password           = "DevOps321"
  db_subnet_group_name      =aws_docdb_subnet_group.docdb_subnet_group.name
  skip_final_snapshot     = true
  vpc_security_group_ids  = [aws_security_group.allow_mongodb.id]
}

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
