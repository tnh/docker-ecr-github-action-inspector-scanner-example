# Stage 1: Update base image and prepare files
FROM ubuntu:22.04 AS builder

# Update packages and install nginx
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y nginx curl ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create a custom index.html
RUN echo "<!DOCTYPE html><html><head><title>AWS Inspector Demo</title></head><body><h1>Docker Image Scanned with AWS Inspector</h1><p>This image was built with security scanning enabled.</p></body></html>" > /var/www/html/index.html

# Stage 2: Create the final nginx image
FROM nginx:stable-alpine

# Update Alpine packages to demonstrate security patching
RUN apk update && \
    apk upgrade && \
    apk add --no-cache bash curl && \
    rm -rf /var/cache/apk/*

# Copy custom nginx configuration and content from builder
COPY --from=builder /var/www/html/index.html /usr/share/nginx/html/index.html

# Add health check
HEALTHCHECK --interval=30s --timeout=3s \
  CMD curl -f http://localhost/ || exit 1

# Add build information
ARG GIT_SHA="unknown"
LABEL git_sha=$GIT_SHA
LABEL maintainer="your-email@example.com"
LABEL version="1.0"
LABEL description="Example nginx container with AWS Inspector scanning"

# Expose port
EXPOSE 80

# Default command
CMD ["nginx", "-g", "daemon off;"] 