resource "aws_instance" "Amazon-Linux2-Server" {
  count         = 2
  ami           = "ami-07761f3ae34c4478d"
  instance_type = "t2.micro"
  key_name      = "macbookreal"
  vpc_security_group_ids = [aws_security_group.Allow-HTTP2.id]
  tags = {
    Name = "Amazon-Linux2-VM"
  }
}
resource "aws_security_group" "Allow-HTTP2" {

  name = "Allow-HTTP2"
  ingress {
    description = "http"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "ssh"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "custom tcp"
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "All traffic"
    from_port = 0
    to_port = 0
    protocol = "all"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
