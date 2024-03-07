# Use the Alpine Linux base image
FROM alpine:3.19

# Update the package repository and install SQLite
RUN apk update && \
    apk add sqlite

# Set the working directory
WORKDIR /app

# Expose the port used by your application (if applicable)
EXPOSE 8191