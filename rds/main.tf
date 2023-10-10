resource "aws_db_instance" "mydb" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "postgres"
  engine_version       = "11.9"
  instance_class       = "db.t2.micro"
  name                 = "mydatabase"
  username             = "dbusername"
  password             = "dbpassword"
  parameter_group_name = "default.postgres11"
  skip_final_snapshot  = true
  publicly_accessible  = false
}