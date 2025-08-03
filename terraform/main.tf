provider "aws" {
    region = var.aws_region 
}

resource "aws_key_pair" "deployer"{
    key_name = var.key_name 
    public_key = file(var.public_key_path)
}

resource "aws_security_group" "allow_ssh_http_5"{
    name = "allow_ssh_http_5"
    description = "Allowing traffic"

    ingress{
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress{
        from_port = 3000
        to_port = 3000
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress{
        from_port = 0
        to_port = 0 
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }


}

resource "aws_instance" "web"{
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = aws_key_pair.deployer.key_name
    vpc_security_group_ids = [aws_security_group.allow_ssh_http_5.id] 
    user_data = file("${path.module}/user_data.sh")


    tags = {
        Name = "ec2_terraform"
    }
}
#ss 