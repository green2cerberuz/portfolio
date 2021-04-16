DOCKERFILE_PATH?= ./provision/Dockerfile
CONTAINER_NAME?= portfolio
IMAGE_NAME?= node-environment
USERNAME?= node

all: docker.build docker.start

docker.build:
	docker build -t $(IMAGE_NAME) --build-arg USER_ID=$(shell id -u) \
	--build-arg GROUP_ID=$(shell id -g) --build-arg USERNAME=$(USERNAME) \
	-f $(DOCKERFILE_PATH) .

docker.start:
	docker run --rm -it --name $(CONTAINER_NAME) -p 8000:8000 \
	-v `pwd`:/usr/src -v nodemodules:/usr/src/node_modules $(IMAGE_NAME) \
	yarn run start

apv.updateversion:
	docker run --rm -it --name $(CONTAINER_NAME) -p 8000:8000 \
	-v `pwd`:/usr/src -v nodemodules:/usr/src/node_modules $(IMAGE_NAME) \
	yarn apv update $(TYPE)

apv.setstatus:
	docker run --rm -it --name $(CONTAINER_NAME) -p 8000:8000 \
	-v `pwd`:/usr/src -v nodemodules:/usr/src/node_modules $(CONTAINER_NAME) \
	yarn apv update $(TYPE)
