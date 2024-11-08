#!/bin/bash
sudo yum update -y
sudo yum install httpd -y
sudo systemctl enable httpd
sudo systemctl start httpd
echo "<h1>hello from launch template $(hostname -f)</h1>" | sudo tee /var/www/html/index.html > /dev/null
 