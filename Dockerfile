# Use a lightweight Nginx web server image
FROM nginx:alpine

# Copy your website files into Nginx's public web directory
COPY . /usr/share/nginx/html

# Expose port 80 for web traffic
EXPOSE 80
