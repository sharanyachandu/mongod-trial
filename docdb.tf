
resource "aws_docdb_cluster" "docdb" {
  engine                    = "docdb"
  cluster_identifier        = "robot-${var.ENV}-docdb"
  master_username           = "centos"
  master_password           = "DevOps321"
  db_subnet_group_name      =aws_docdb_subnet_group.docdb_subnet_group.name
  skip_final_snapshot     = true
  vpc_security_group_ids  = [aws_security_group.allow_mongodb.id]
}







/*
resource "aws_docdb_cluster" "docdb" {
  cluster_identifier      = "robot-${var.ENV}-docdb"
  engine                  = "docdb"
  master_username         = local.DOCDB_USER
  master_password         = local.DOCDB_PASS
  skip_final_snapshot     = true
  db_subnet_group_name    = aws_docdb_subnet_group.docdb_subnet_group.name
  vpc_security_group_ids  = [aws_security_group.allow_mongodb.id]
}
*/