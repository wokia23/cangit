  vpc_cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"
  vpc_tags = {
        Name = "AirCanadaVPC"
        Env = "Prod"
        Project = "AirCanada-2026"
        PM = "John Doe"
    }
    publicSN_cidr_block = "10.0.0.0/24"
    privateSN_cidr_block = "10.0.1.0/24"
    pubrt_cidrblock = "0.0.0.0/0"
    privatert_cidrblock = "0.0.0.0/0"
    ec2_ami = "ami-0532be01f26a3de55"
    ec2_instance_type = "t2.micro"