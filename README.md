# Retropie Docker

WIP: Getting Retropie running on Raspbian via a Docker container

To get started, run the following commands to install Doker and give the `pi` user the proper permissions : 
```
curl -sSL https://get.docker.com | sh

sudo usermod -aG docker pi
```

## Build 

Download the Dockerfile to your Raspberry Pi (or other ARM-based computer running Docker) and build the image with the following command :
```
docker build -t retropie-docker .
```

## Running 

`docker run -it retropie-docker`

## Issues

Docker run currently fails with the error `* failed to open vchiq instance`. At a minimum, this probably requires some ENV variables to be passed to the running container. 
