resource "aws_key_pair" "ec2keypair" {
key_name   = "ec2keypair"
public_key = "ssh-rsa REDACTED"
}

resource "aws_instance" "capstone" {
ami           = "ami-0b0ea68c435eb488d"
instance_type = "t2.micro"
key_name = "ec2keypair"
}

resource "aws_lb" "capstone_lb" {
  name               = "capstone_lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.secgroup.id]
  subnets            = [for subnet in aws_subnet.public : subnet.id]

  enable_deletion_protection = true

  tags = {
    Environment = "production"
  }
}
