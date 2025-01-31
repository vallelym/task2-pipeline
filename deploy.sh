#!/bin/bash

# Remove existing containers
docker rm -f $(docker ps -a -q)

# Create a network
docker network create my_network

# Create volume
docker volume create my_volume

# Build the Flask and MySQL images
docker build -t vallelym/task2-pipeline:flask-app ./flask-app
docker build -t vallelym/task2-pipeline:db ./db

# Run MySQL container
docker run --name my-mysql --network my_network -e MYSQL_ROOT_PASSWORD=my-secret-pw -v my_volume:/var/lib/mysql -d vallelym/task2-pipeline:db

# Run Flask container
docker run --name my-flask-app --network my_network -p 5000:5000 -d vallelym/task2-pipeline:flask-app

# Run Nginx container
docker run --name my-nginx --network my_network -p 80:80 -d nginx

# Show all containers
docker ps -a
