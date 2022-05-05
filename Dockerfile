# reference for Dockerfile: https://codefresh.io/docker-tutorial/create-docker-images-for-java/

# the first stage of our build will use a maven 3.6.1 parent image
FROM maven:3.8.5-jdk-11 AS MAVEN_BUILD

# copy the pom and src code to the container
COPY ./ ./

# package our application code
RUN mvn clean package

# the second stage of our build will use open jdk 11
FROM openjdk:11

# copy only the artifacts we need from the first stage and discard the rest
COPY --from=MAVEN_BUILD /devops_henz/target/devops_henz-0.0.1-SNAPSHOT.jar /devops_henz_dockerized.jar

EXPOSE 8097

# set the startup command to execute the jar
CMD ["java", "-jar", "/devops_henz_dockerized.jar"]