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

Run the container in privileged daemon mode. Try adding some additional volumes/variables based on some of the ideas from [here] (https://blog.jessfraz.com/post/docker-containers-on-the-desktop/) :

```
docker run -d -v /dev/snd:/dev/snd -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY --privileged -t retropie-docker
```

## Issues

Docker run currently fails with the following error :
```
lvl0:    Error creating SDL window!
    Could not initialize OpenGL / GLES library
lvl0:   Renderer failed to initialize!
lvl0:   Window failed to initialize!
```
