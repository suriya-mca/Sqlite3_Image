# Use the Alpine Linux base image
FROM alpine:3.20

# Update the package repository and install SQLite
RUN apk update && \
    apk add --no-cache sqlite && \
    rm -rf /var/lib/apk/lists/* && \
    rm -rf /var/cache/apk/*

# Set the working directory
WORKDIR /data

# Expose the port used by your application (if applicable)
EXPOSE 8191

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["sh", "/entrypoint.sh"]
