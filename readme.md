# Terraform tips and tricks

# 1. null resources are your friends

## scenario
i have terraform defining a vpc with one subnet, i want to change this to have multiple subnets and automatically assign the proper cidr ranges to these subnets.
I want to test the cidr range "subnet" function and see if it works before i actually deploy anything.
## solution
use null resources, they are an amazing way of testing things without having to actually deploy cloud resources.
# 2. data http is awesome

## scenario
i have a security group that allows access to an EC2 instance from my ip address only.
the problem is that my ip address changes because of my dumb ISP.
i dont want to have to feed it my ip all the time, 
## solution
use data http, there are awesome free resources out there that will give you your ip, which you can then use for your security group.
# 3. data local is also cool

## scenario
i have multiple accounts and im sick of having to upload my rsa key all the time, i have terraform code for a key pair, but i dont want the public key as a string in my terraform code, also coworkers might want to use this code and they want to use their own rsa key.
## solution
use data local_file, it will allow you to read files
# 4. stop misinterpreting me

## scenario
i have an ec2 instance that has some userdata, i want to use the local linux OS' environment variable to do something, in posix i would reference that variable by using a dollar sign and some curly braces.
problem is, so does terraform.
## solution
use double dollars. 
# 5. lookups for defaults

## scenario
i have a map with a list of users, i want to create a resource for each of these users, problem is, sometimes i dont have all the data i need. how do i create the resource with a default value if none is provided?
## solution
use lookup.
# 6. count for nothing

## scenario
i have a resource that i want created in some cases but not in others.
terraform doesnt allow me to arbitrarily create resources based on conditions.
## solution
actually it does.
count 0 is a valid number of resources.
so by combining count with a conditional statement you can have terraform create a resource or not.
# 7. terraform can zip

## scenario
i have a lambda including source code, that i want to deploy using terraform.
i need to first zip and upload the source code to an s3 bucket if i want to create the lambda.
## solution
you can just take the source code with the terraform, and zip it.
# 8. templates are fun

## scenario
i want to deploy webserver ec2 instances. but i want each webserver to have its hostname in the footer so i can see which instance my loadbalancer is directing me to.
## solution
use templates.
# 9. random pets

## scenario
i am creating heaps of resources and my naming convention is becoming boring, i could use some good names for my resources but im running out of pokemon references
## solution
random_pet resource will generate random names that make sense to humans, like docker.
# 10. length and counting

## scenario
i have multiple resources and i want to count them all together.
when i have 3 of resource type 1
and 3 of resource type 2
i want them to look like this:
- type_one0
- type_one1
- type_one2
- type_two3
- type_two4
- type_two5
## solution
use length and math to add values together.
# 11. looking for ami's in all the wrong places
## scenario
im deploying an EC2 instance in ap-southeast-2 and it needs to be an amazon linux 2003 instance.
the ami id for is "ami-0361bbf2b99f46c1d".
when deploying in another region, my terraform fails, turns out the ami id is different per region.
## solution
use the "aws_ami" data resource.
combined with filter, this will get you the ami di you need regardless of region.


# bonus
`for i in $(tf state list); do tf state show $i; done`