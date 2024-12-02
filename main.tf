provider "aws" {
  region = "ap-south-1"  # Replace with your AWS region
}

# Reference the existing key pair
data "aws_key_pair" "existing_key" {
  key_name = "test_01_keypair"  # Replace with your existing key pair name
}

# Reference an existing security group (or create one if needed)
data "aws_security_group" "existing_sg" {
  id = "sg-00f57df5ae778dccf"  # Replace with your security group ID
}

# EC2 instance resource
resource "aws_instance" "flask_app" {
  ami           = "ami-0dee22c13ea7a9a67"  # Ubuntu AMI ID
  instance_type = "t2.micro"
  key_name      = data.aws_key_pair.existing_key.key_name
  security_groups = [
    data.aws_security_group.existing_sg.name
  ]
  tags = {
    Name = "FlaskAppInstance"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"  # Default user for Ubuntu AMIs
    private_key = file("test_01_keypair.pem")  # Path to your private key
    host        = self.public_ip
  }

  provisioner "file" {
    source      = "http_service.py"  # Replace with the path to your Flask script
    destination = "/home/ubuntu/http_service.py"
  }

provisioner "remote-exec" {
  inline = [
    "sudo apt update -y",
    "sudo apt install -y python3-venv python3-pip",  # Install venv and pip
    "python3 -m venv /home/ubuntu/flask_env",  # Create virtual environment in home directory
    "sudo /home/ubuntu/flask_env/bin/pip install flask boto3",  # Install Flask and Boto3 in the virtual environment
    "sudo /home/ubuntu/flask_env/bin/python /home/ubuntu/http_service.py"  # Run the Python script using the virtual environment's Python
  ]
}
}

# Output public IP for connection
output "instance_public_ip" {
  value = aws_instance.flask_app.public_ip
}
