#!/bin/bash

# Pull the latest Docker image
docker pull jaeyoungahn/linkhub:latest

# Get the current active environment
ACTIVE_ENV=$(docker exec -it swagger-test_nginx_1 nginx -T | grep "server web_" | awk -F'_' '{print $2}' | cut -d ':' -f 1)

# Switch between blue and green environments
if [ "$ACTIVE_ENV" == "green" ]; then
  # Stop and remove the current blue environment
  docker-compose stop swagger-test_web_blue
  docker-compose rm -f swagger_test_web_blue

  # Start the blue environment
  docker-compose up -d web_blue

  # Switch traffic to the blue environment
  docker exec -it swagger-test_nginx_1 sed -i 's/web_green/web_blue/' /etc/nginx/nginx.conf
  docker exec -it swagger-test_nginx_1 nginx -s reload
else
  # Stop and remove the current green environment
  docker-compose stop swagger-test_web_green
  docker-compose rm -f swagger-test_web_green

  # Start the green environment
  docker-compose up -d web_green

  # Switch traffic to the green environment
  docker exec -it swagger-test_nginx_1 sed -i 's/web_blue/web_green/' /etc/nginx/nginx.conf
  docker exec -it swagger-test_nginx_1 nginx -s reload
fi
