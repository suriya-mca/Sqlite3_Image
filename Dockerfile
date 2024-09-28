# First stage: Build SQLite in a lightweight environment
FROM alpine:3.19.4 AS build

# Update the package repository and install build dependencies
RUN apk update && \
    apk add --no-cache sqlite

# Final stage: Create the minimal runtime image
FROM alpine:3.19.4

# Copy the necessary binaries and libraries from the build stage
COPY --from=build /usr/bin/sqlite3 /usr/bin/sqlite3
COPY --from=build /lib/ld-musl-* /lib/

# Set the working directory
WORKDIR /app

# Expose the port used by your application (if applicable)
EXPOSE 8191

# Clean up unnecessary files
RUN rm -rf /var/lib/apk/lists/* && \
    rm -rf /var/cache/apk/*

# Define the entrypoint
ENTRYPOINT ["sh", "/entrypoint.sh"]
