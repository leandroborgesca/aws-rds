resource "aws_rds_cluster" "rds_cluster" {
  database_name = "awsrdssample"
  cluster_identifier = "aws-rds-cluster-01"
  engine = "aurora-mysql"
  master_username = "borges"
  master_password = "borges123"
  backup_retention_period = 5
  preferred_backup_window = "07:00-09:00"
  apply_immediately = true
  tags = {
    Name = "aws-rds-cluster-01"
  }
  skip_final_snapshot = true
}

resource "aws_rds_cluster_instance" "cluster_instances" {
  count = 1
  identifier = "aws-rds-cluster-instance-01"
  cluster_identifier = aws_rds_cluster.rds_cluster.id
  instance_class = "db.t3.medium"
  engine = "aurora-mysql"
  publicly_accessible = false
}