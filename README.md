# Spring Boot Web Application
This repository has the project files for a tutorial series on Spring Boot available from by website at [Spring Framework Guru](https://springframework.guru)

## Checkout the full tutorial here!
[Spring Boot - making Spring Fun again!](https://springframework.guru/spring-boot-web-application-part-1-spring-initializr/)

This Application works on the port 8080

#Building Locally and Pushing it to AWS ECS

## Run Maven build it will create target directory

mvn clean install

###Building Docker Image

#Build your Docker image using the following command. You can skip this step if your image is already built

docker build -t testing .

#Tag this image as latest

#After the build completes, tag your image so you can push the image to this repository:## This i am usig my personal account you can give ur AWS ECS

docker tag testing:latest 624704405165.dkr.ecr.us-east-1.amazonaws.com/testing:latest


#Login to AWS ## Before this Configure AWS CLI

##1) Retrieve the docker login command that you can use to authenticate your Docker client to your registry:  Note: If you receive an "Unknown options: --no-include-email" error, install the latest version of the AWS CLI. 

aws ecr get-login --no-include-email --region us-east-1

#Above Command will generate login command to login to AWS ECS and enter that command to login

#### Run the following command to push this image to your newly created AWS repository:

docker push 624704405165.dkr.ecr.us-east-1.amazonaws.com/testing:latest
