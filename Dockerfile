# Build the application using Maven
FROM maven:3.9.6-eclipse-temurin-17-alpine AS builder
WORKDIR /app
# Copy only pom.xml and download dependencies first (layer caching)
COPY pom.xml .
RUN mvn dependency:go-offline
# Copy the rest of the code and build the jar
COPY src ./src
RUN mvn clean package -DskipTests

# Run the application
FROM openjdk:17-jdk-alpine
WORKDIR /app
# Copy the built jar from the previous stage
COPY --from=builder /app/target/*.jar app.jar
EXPOSE 8080
# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]