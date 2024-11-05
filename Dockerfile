# First stage: Build SQLite in a lightweight environment
FROM alpine:3.19.4 AS build

# Update the package repository and install build dependencies
RUN apk update && \
    apk add --no-cache sqlite-dev

# Final stage: Create the minimal runtime image
FROM scratch

# Copy the necessary binaries and libraries from the build stage
COPY --from=build /usr/bin/sqlite3 /usr/bin/sqlite3
COPY --from=build /lib/ld-musl-* /lib/

# Set the working directory
WORKDIR /app

# Expose the port used by your application (if applicable)
EXPOSE 8191

# Set the environment variable for logging
ENV SQLITE_LOG_LEVEL=2

# Define the entrypoint and health check
HEALTHCHECK CMD sqlite3 -v || exit 1
ENTRYPOINT ["sh", "/entrypoint.sh"]
CMD ["-version"]