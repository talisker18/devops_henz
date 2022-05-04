# base docker image
openjdk:16-alpine3.13

WORKDIR /app

COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN chmod +x ./mvnw dependency:go-offline

COPY src ./src

EXPOSE 3000

CMD ["./mvnw", "spring-boot:run"]