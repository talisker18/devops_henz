# base docker image
FROM openjdk:8-jdk-alpine
COPY /home/hjoel87gmx/Desktop/devops_henz/target/devops_henz-0.0.1.war devops_henz_docker-0.0.1.war
ENTRYPOINT ["java","-jar","/devops_henz_docker-0.0.1.war"]