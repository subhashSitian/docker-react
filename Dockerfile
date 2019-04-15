
# Docker file for Production version of build 

# Step - 1 Build the project 
#Creating tag/name for this phase)
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .

# Install Dependecies before Build the project which need all dependecies
RUN npm install
COPY . . 
RUN npm run build

# Step - 2 Get the NGINX and run the build code from above
FROM nginx
#(copy somthing from builder phase to nginx predefined folder)
COPY --from=builder /app/build /usr/share/nginx/html  