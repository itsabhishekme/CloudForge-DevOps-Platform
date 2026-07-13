# ==========================================
# CloudForge DevOps Platform
# Nginx Production Dockerfile
# ==========================================

FROM nginx:1.27-alpine

LABEL maintainer="Abhishek Shrivastava"
LABEL project="CloudForge DevOps Platform"
LABEL description="Production Nginx Reverse Proxy"

# Remove default nginx configuration
RUN rm -f /etc/nginx/conf.d/default.conf

# Copy custom configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Create cache directories
RUN mkdir -p /var/cache/nginx \
    && mkdir -p /var/run \
    && chmod -R 755 /var/cache/nginx

# Expose ports
EXPOSE 80
EXPOSE 443

# Health Check
HEALTHCHECK --interval=30s --timeout=5s --start-period=15s --retries=3 \
    CMD wget --quiet --tries=1 --spider http://localhost/ || exit 1

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]