#!/bin/bash

#login into DockerHub:
docker login -u ${{ secrets.DOCKERHUB_USERNAME }} -p ${{ secrets.DOCKERHUB_PASSWORD }} registry.hub.docker.com

#stopping existing container:
docker stop react
docker rm react

#building a image:
docker build -t react-ci/cd .

#running a container from the created image:
docker run -d -it --name react -p 80:80 react-ci/cd

#pushing the image to dockerhub:
docker tag react-ci/cd vaishnavivasista/react-app:ci-cd
docker push vaishnavivasista/react-app:ci-cd
