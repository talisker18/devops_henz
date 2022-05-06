FROM maven:3.8.5-jdk-11 AS MAVEN_BUILD

# package our application code
RUN mvn clean package

COPY target/devops_henz-0.0.1-SNAPSHOT.jar docker-devops_henz-0.0.1-SNAPSHOT.jar

EXPOSE 5000

ENTRYPOINT ["java","-jar","/docker-devops_henz-0.0.1-SNAPSHOT.jar"]