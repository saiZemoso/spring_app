FROM maven:3.8.3-openjdk-11-slim as root

WORKDIR /root-app

COPY pom.xml .

RUN mvn dependency:go-offline

COPY src ./src


FROM openjdk:11-jre-slim

WORKDIR /app

COPY --from=root /root-app/target/HelloWorld-*.jar ./app.jar

EXPOSE 8080

CMD ["java","-jar","app.jar"]