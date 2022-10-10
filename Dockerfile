#### BEGIN DOCKERFILE
######################### 
FROM eclipse-temurin:11-jre-alpine

# Copy binary application.
COPY target/ocp-aws-secret-1.0.0-SNAPSHOT.jar /deployments/

# Run application
ENTRYPOINT ["java", "-jar", "/deployments/ocp-aws-secret-1.0.0-SNAPSHOT.jar"]
#########################
