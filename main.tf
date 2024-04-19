provider "aws" {
    region = "us-east-1" #set desired or pricing management AWS region
}

resource "aws_instance" "filecloud_instance" {
    ami = "ami-0022f774911c1d690" #specify ami id for filecloud
    instance_type = "t2.medium" #set desired instance type
    
    tags = {
      Name = "FileCloud Instance"
    }

}
resource "aws_s3_bucket" "filecloud" {
    bucket = "owncloud"
    key = "owncloud.tar.gz"
    source = "/home/atharva/Desktop/owncloud.tar.gz"
}

resource "aws_s3_bucket" "filecloud" {
    bucket = "owncloud"
    acl = "private"

    versioning{
        enabled = true
    }
}

resource "aws_iam_user" "owncloud_user" {
  name = "owncloud_user"

  tags = {
    Name = "owncloud_user"
  }
}

resource "aws_iam_access_key" "owncloud" {
  user = aws_iam_user.owncloud_user.name
}

#Modify FileCloud config for S3 Integration
#You Would need to implement a script or template to update the configuration file

 data "template_file" "cloud_config" {
   template = file("path/to/cloud_config_template.php")
   vars = {
     s3_bucket_name = aws_s3_bucket.filecloud_storage.owncloud
   }
 }

# Output the Instance Public IP
output "filecloud_instance_ip" {
  value = aws_instance.filecloud_instance.ipv4_address_count
}
