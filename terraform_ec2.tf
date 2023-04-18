resource "aws_key_pair" "ec2keypair" {
key_name   = "ec2keypair"
public_key = "ssh-rsa REDACTED"
}

resource "aws_instance" "capstone" {
ami           = "ami-0b0ea68c435eb488d"
instance_type = "t2.micro"
key_name = "ec2keypair"
}
