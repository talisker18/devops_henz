FROM openjdk:11-slim-buster as build

WORKDIR /app

COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN ./mvnw dependency:go-offline

COPY src ./src

EXPOSE 5000

CMD ["./mvnw", "spring-boot:run"]

