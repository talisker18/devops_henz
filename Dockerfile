FROM maven:3.8.5-jdk-11 AS MAVEN_BUILD

COPY ./ ./

# package our application code
RUN mvn clean package -DskipTests

COPY target/devops_henz-0.0.1-SNAPSHOT.war docker-devops_henz-0.0.1-SNAPSHOT.war

EXPOSE 5000

ENTRYPOINT ["java","-jar","/docker-devops_henz-0.0.1-SNAPSHOT.war"]