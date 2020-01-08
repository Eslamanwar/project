resource "aws_security_group" "rds_sg" {
    name = "${var.app_name}-rds"
    vpc_id = "${aws_vpc.vpc_app.id}"
    ingress {
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        cidr_blocks = ["${aws_vpc.vpc_app.cidr_block}"]
    }
}

# RDS module for the backend MySQL db.
module "rds" {
  source              = "git::https://github.com/terraform-aws-modules/terraform-aws-rds"
  identifier          = "demodb"
  allocated_storage   = 10

  engine              = "mysql"
  major_engine_version = "5.7"
  engine_version      = "5.7.19"
  instance_class      = "db.t2.large"
  family              = "mysql5.7"

  #kms_key_id          = "arn:aws:kms:eu-west-1:060948813048:key/905d1ca1-1c45-4fc6-8888-e0f5450b4d65"

  name                = "demodb"
  username            = "user"
  password            = "YourPwdShouldBeLongAndSecure"
  port                = "3306"
  skip_final_snapshot = true

  multi_az = true
  copy_tags_to_snapshot = true
  #storage_encrypted = true

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"


  vpc_security_group_ids    = ["${aws_security_group.rds_sg.id}"]
  subnet_ids                = ["${aws_subnet.public_az1.id}", "${aws_subnet.public_az2.id}", "${aws_subnet.public_az3.id}"]
  timeouts   = {
    "create" = "25m"
  }

  tags = {
    sre_candidate = "eslam_mohammed"
  }
}
