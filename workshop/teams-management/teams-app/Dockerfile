# Dockerfile
FROM node:18-alpine AS build

WORKDIR /app

# Copy package files
COPY package*.json ./
RUN npm ci --only=production

# Copy source code
COPY . .
#COPY *.json ./
#COPY src/ ./

# Build the app for production
RUN npm run build:prod

# Use nginx to serve the app
FROM nginx:alpine

# Copy built app to nginx
COPY --from=build /app/dist/teams-ui /usr/share/nginx/html

# Copy nginx configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

RUN chgrp -R root /var/cache/nginx /var/run /var/log/nginx && \
    chmod -R 777 /var/cache/nginx /var/run /var/log/nginx

# Create non-root user for security (with explicit UID/GID)
#RUN addgroup -S appgroup -g 1001 && adduser -S appuser -G appgroup -u 1001 && \
#    mkdir -p /var/cache/nginx && \
#    chown 1001:1001 /var/cache/nginx

#USER 1001

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
