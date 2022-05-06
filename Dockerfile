FROM openjdk:11-slim-buster as build

COPY .mvn .mvn
COPY mvnw .
COPY pom.xml .

RUN ./mvnw -B dependency:go-offline                          

COPY src src

RUN ./mvnw -B package                                        

FROM openjdk:11-jre-slim-buster

COPY --from=build target/devops_henz-0-0.1-SNAPSHOT.war .

EXPOSE 5000

ENTRYPOINT ["java", "-jar", "devops_henz-0-0.1-SNAPSHOT.war"]

