# Portfolio

Personal portfolio project.
Environment is setup to run node js inside a docker image. Have preconfigure a sass compiler and a live server to improve front end development with hot reloading.

Base image already have installed yarn so we only need to use it.

## Some commands for docker development

Build development environment:

```shell
docker build -t <image-name> --build-arg USER_ID=$(id -u) --build-arg GROUP_ID=$(id -g) --build-arg USERNAME=<username> -f ./provision/Dockerfile .
```

To run a container:

``` shell
docker run --rm --name <container_name> -p 8000:8000 -v `pwd`:/usr/src -v nodemodules:/usr/src/node_modules <image-name> yarn run start
```

To remove a container:

`docker rm <container-name>`

To add a new package to our image:

```shell
docker run --rm -p 8000:8000 -v `pwd`:/usr/src -v nodemodules:/usr/src/node_modules <image-name> yarn add <package-name>
```
