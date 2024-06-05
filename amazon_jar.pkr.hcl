source "amazon-ebs" "amazon_linux" {
  ami_name                = "amazon-linux-ami-with-jar"
  source_ami              = "ami-0f403e3180720dd7e"
  instance_type           = "t2.micro"
  region                  = "us-east-1"
  ssh_username            = "ec2-user"
  ssh_keypair_name        = "packer"
  ssh_private_key_file    = "packer.pem"
}

build {
  sources        = ["source.amazon-ebs.amazon_linux"]
  provisioner "file" {
    source      = "webapp.jar"
    destination = "webapp.jar"
  }
  provisioner "shell" {
    inline = [
      "sudo yum update -y",
      "sudo dnf install java-17-amazon-corretto -y"
    ]
  }
}
