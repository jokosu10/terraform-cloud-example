resource "aws_vpc" "my_vpc" {
    cidr_block = var.vpc_cidr

    tags = {
        Name = "${var.vpc_name}-${local.vpc_name_prefix}"
    }
}

resource "aws_subnet" "my_vpc_subnet" {
    vpc_id            = aws_vpc.my_vpc.id  // Ensure this matches your VPC resource
    cidr_block        = "10.93.0.0/26"          // Subnet within the VPC CIDR range
    availability_zone = var.availability_zone            // Change to your desired AZ

    tags = {
        Name = "${var.vpc_name}-${local.vpc_name_prefix}"
    }
}

resource "aws_key_pair" "my_ssh_key" {
    key_name   = local.ssh_key_name
    public_key = file("${path.module}/demo-terraform-cloud.pub")
}

resource "aws_security_group" "my_firewall" {
    vpc_id = aws_vpc.my_vpc.id
    name = local.firewall_name
    description = "Allow SSH inbound traffic"

    ingress {
        description = "SSH from anywhere"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_instance" "my_instance" {
    ami           = local.ami_image
    instance_type = var.instance_type
    subnet_id     = aws_subnet.my_vpc_subnet.id
    key_name      = aws_key_pair.my_ssh_key.key_name

    vpc_security_group_ids  = [aws_security_group.my_firewall.id]

    tags = {
        Name = "${var.instance_name}-${local.instance_name_prefix}"
    }
}