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
- 
-
