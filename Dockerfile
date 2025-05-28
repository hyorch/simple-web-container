FROM nginx:alpine

# Expose port 80
EXPOSE 80   
# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]



