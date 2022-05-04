FROM openjdk:8-jdk-alpine
COPY target/devops_henz-0.0.1.war devops_henz_docker-0.0.1.war
ENTRYPOINT ["java","-jar","/devops_henz_docker-0.0.1.war"]