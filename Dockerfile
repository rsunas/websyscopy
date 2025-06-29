# Use an official Node.js runtime as a parent image
FROM node:18-alpine

# Set the working directory in the container
WORKDIR /app

# Copy package.json and install serve
COPY package.json ./
RUN npm install

# Copy the built web app
COPY build/web ./build/web

# Expose port 8080 to the outside world
EXPOSE 8080

# Start the static server
CMD ["npm", "start"]