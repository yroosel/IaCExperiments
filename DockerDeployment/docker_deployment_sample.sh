#!/bin/bash
# Version 1
# Set up variables
APP_REPO="https://github.com/yroosel/sample_app.git"
APP_FOLDER="sample_app"
DEPLOY_FOLDER="sample_deployment"
DOCKER_IMAGE="sample_deployment_image"
DOCKER_CONTAINER="sample_deployment_container"
LOG_FILE="sample_deploy_log.txt"
DOCKERFILE="Dockerfile"

# Function to log information with timestamp
log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE"
}

# Create deployment folder
cd
mkdir -p "$DEPLOY_FOLDER"
cd "$DEPLOY_FOLDER"

# Clone the sample app repository
git clone "$APP_REPO" "$APP_FOLDER"
cd "$APP_FOLDER"

# Create the custom Dockerfile
echo "FROM python:3.9.10-slim-buster" > "$DOCKERFILE"
echo "RUN pip install flask" >> "$DOCKERFILE"
echo "COPY ./static /home/microweb_app/static/" >> "$DOCKERFILE"
echo "COPY ./templates /home/microweb_app/templates/" >> "$DOCKERFILE"
echo "COPY ./sample_app.py /home/microweb_app/" >> "$DOCKERFILE"
echo "EXPOSE 5555" >> "$DOCKERFILE"
echo "CMD python /home/microweb_app/sample_app.py" >> "$DOCKERFILE"
log "Created the custom Dockerfile."

# Build Docker image
docker build -t "$DOCKER_IMAGE" .
log "Docker image '$DOCKER_IMAGE' built successfully."

# Run Docker container
log "Starting Microservice..."
docker run --name "$DOCKER_CONTAINER" -d -p 5555:5555 "$DOCKER_IMAGE"

# Wait for a while to let the app start
sleep 10
log "Docker container '$DOCKER_CONTAINER' is running."

# Test the running app using curl
CURL_RESULT=$(curl -s http://localhost:5555)
log "Received response from the app: $CURL_RESULT"

# Gather information about the image and container
docker inspect "$DOCKER_IMAGE" >> "$LOG_FILE"
docker inspect "$DOCKER_CONTAINER" >> "$LOG_FILE"

# Stop and remove the Docker container
docker stop "$DOCKER_CONTAINER" && docker rm "$DOCKER_CONTAINER"
log "Docker container '$DOCKER_CONTAINER' stopped and removed."

log "Deployment process completed successfully."