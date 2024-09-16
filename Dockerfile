# Use the Alpine Linux base image
FROM alpine:3.19.4

# Update the package repository and install SQLite
RUN apk update && \
    apk add --no-cache sqlite && \
    rm -rf /var/lib/apk/lists/* && \
    rm -rf /var/cache/apk/*

# Set the working directory
WORKDIR /app

# Expose the port used by your application (if applicable)
EXPOSE 8191

ENTRYPOINT ["sh", "/entrypoint.sh"]