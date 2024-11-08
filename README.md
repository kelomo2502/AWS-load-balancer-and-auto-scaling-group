# aws-load-balancer-and-auto-scaling-group

This is an implementation of an AWS architecture using an Elastic Load Balancer (ELB) and Auto Scaling Group (ASG) to ensure high availability and scalability. The setup automatically distributes incoming traffic across multiple EC2 instances and adjusts the number of instances based on demand, optimizing both performance and cost-efficiency.

## Getting Started

- Locate and click on the EC2 console from the AWS console menu
- Scroll down until you find the target group menu
![Target group](/images/target-group.png)
- Click on create target group option
- Choose instances as target group
- Now provide a name for your target group
![Target group name](/images/target-group-name.png)
- Set the protocol as HTTP
- Choose port number as 80
- Select ipv4 as ip address type
- Select the VPC where your instances are located
- You can keep all the other settings as default and proceed to next
- Choose all the instances you have created to serve as target group for the application load balancer
- Now click on include as pending below
![Include as pending below](/images/include.png)
- Click on create target group
![Create target group](/images/create.png)
- The target group has been successfully created

## Create a load balancer

- On the EC2 page, scroll until you locate the load balancer tab
- [Load balancer tab](/images/load-balancer-tab.png)
- Click on the create load balancer  button
![Creating new load balancer](/images/create-load-balancer-button.png)
- Select Application Load balancer from the options provided and click create
![Application load balancer](/images/application_LB.png)
- Provide a descriptive name for your application load balancer
- The select internet facing as the scheme
- Choose ipv4 address
- Select your instances VPC
- Select your subnets for availability zones
- Select your security group and in this instance we are using our default security group
- Select the target group you have created
- We can leave other settings as is and click on create load balancer
- Now our application load balancer has been created
- Copy the load balancer DNS url and paste in the browser
- We can see the load balancer is distributing traffic as expected

## Creating an auto scaling group

- Search the aws search bar and look for auto scaling group. You could also find it from the EC2 console
![Auto scaling group](/images/auto-scaling-group.png)
- Click on create auto scaling Group
- Give a descriptive name to the group
- Click on create launch template
- In the quickstart section choose your vm distro AMI option(ubuntu, amazon-linux etc)
- Choose the instance type as t2-micro
- Create a name for login key pair and click create new key
- In the network setting, select your public subnets
- Select security group but ensure that the security allows access to all inbound and outbound traffic types
- Click on Advance network configuration
- You can also click on enable the option for assigning pubilc ip address
- Go to Advance detaiils and in the userdata section , you should in the script that installs your webserver and webtemplate. I will show you an example script down below:

``` bash
#!/bin/bash
sudo yum update -y
sudo yum install httpd -y
sudo systemctl enable httpd
sudo systemctl start httpd
echo "<h1>hello from launch template $(hostname -f)</h1>" | sudo tee /var/www/html/index.html > /dev/
```
- You have successfully created a lunch template
- Now go back to the the create auto scaling group tab
- Select the lunch template that you just created
- Click on next
- Choose the required instance attributes
- Select your VPC
- Select availability zones
- Click on next
- Let's choose option to attach a new load balancer
- Select the load balancer type as application load balancer
- Provide a desriptive name for the load balancer
- Choose internet facing for load balancer scheme
- Ensure to review the VPC ID before proceeding
- Choose public subnets for both availability zones
- Provide a name for the target group
- Click next
- Configure the desired capacity for instances created by your auto scaling group
- Also specify minimum and maximum capacity as per your requirement
- Proceed by clicking next
- Click next once more to proceed further
- You can add tags if necessary then click next to proceed
- Review settings you have configured for the auto scaling group and if satisfied, click Create Auto Scaling group button
- Yay! your auto scaling group has been successfully created
- Now you can click on your newly created auto scaling group
- Navugate to instance management section
- here you will see that the auto scaling group has successfully created instances based on our desired configuration
- If you navigate to the load balancer section, you will also notice the load balancerhas been created
- NB: the load balancer might take a while to get provisioned. so be patient and try refresh your page severally
- We can see the behaviour of the auto scaling group if we try to remove the instances created, it tends to replace them as soon as possible. Thats the job of the auto scaling group
