FROM openjdk:11.0.11-jdk

WORKDIR /spring-app2

COPY target/HelloWorld-*.jar app2.jar

EXPOSE 8080

ENTRYPOINT ["java","-jar","app2.jar"]