# Portfolio

[![AppVersion-version](https://img.shields.io/badge/AppVersion-1.1.0-brightgreen.svg?style=flat)](https://github.com/delvedor/appversion?#version)

[![AppVersion-status](https://img.shields.io/badge/Status-stable-brightgreen.svg?style=flat)](https://github.com/delvedor/appversion?#status)

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

## Git Hooks

This projects uses the preparee-commit-message hook to add the branch name to our commit
message. The script can be found at `scripts/prepare-commit-message.sh`. If you want to activate it, yo need to add the following line to `.git/hooks/prepare-commit-message` file after the variable declarations.

`./scripts/prepare-commit-message.sh $COMMIT_MSG_FILE`

## Semantic versioning

This project uses semantic versioning with appversion package. To initialize it run:

```init
docker run --rm -it --name test-front -p 8000:8000 -v `pwd`:/usr/src -v nodemodules:/usr/src/node_modules test-node yarn apv init
```

To update a version run:

```shell
docker run --rm -it --name test-front -p 8000:8000 -v `pwd`:/usr/src -v nodemodules:/usr/src/node_modules test-node yarn apv update <patch/minor/major>
```

To generate a badge:

```shell
docker run --rm -it --name test-front -p 8000:8000 -v `pwd`:/usr/src -v nodemodules:/usr/src/node_modules test-node yarn apv generate-badge <version/status>
```

To set project status:

```shell
docker run --rm -it --name test-front -p 8000:8000 -v `pwd`:/usr/src -v nodemodules:/usr/src/node_modules test-node yarn apv set-status <stable/rc/beta/alpha>
```


