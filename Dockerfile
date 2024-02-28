# Stage 1: Build stage
FROM maven:3.8.1-openjdk-11 AS build
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline -B
COPY src ./src
RUN mvn package

# Stage 2: Final stage with Tomcat
FROM tomcat:9-jdk11-openjdk-slim
WORKDIR /usr/local/tomcat/webapps/
COPY --from=build /app/target/*.war ./ROOT.war
CMD ["catalina.sh", "run"]
