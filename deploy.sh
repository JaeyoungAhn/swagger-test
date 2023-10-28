#!/bin/bash

# Pull the latest Docker image
docker pull jaeyoungahn/linkhub:application-latest

# Get the current active environment
ACTIVE_ENV=$(docker exec swagger-test_nginx_1 nginx -T | grep "server web_" | awk -F'_' '{print $2}' | cut -d ':' -f 1)

# Switch between blue and green environments
if [ "$ACTIVE_ENV" == "green" ]; then
  # Stop and remove the current blue environment
  docker-compose stop web_blue
  docker-compose rm -f web_blue

  # Start the blue environment
  docker-compose up -d web_blue

  # Switch traffic to the blue environment
  sed -i 's/web_green/web_blue/' /home/ec2-user/swagger-test/nginx.conf
  docker-compose exec nginx nginx -s reload
else
  # Stop and remove the current green environment
  docker-compose stop web_green
  docker-compose rm -f web_green

  # Start the green environment
  docker-compose up -d web_green

  # Switch traffic to the green environment
  sed -i 's/web_blue/web_green/' /home/ec2-user/swagger-test/nginx.conf
  docker-compose exec nginx nginx -s reload
fi
