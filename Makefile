DOCKERFILE_PATH?= ./provision/Dockerfile
CONTAINER_NAME?= portfolio
IMAGE_NAME?= node-environment
USERNAME?= node
DEFAULT_NODE_VOLUME?= nodemodules
PORT?= 8000

all: docker.build docker.start

init: 
	docker volume create --name $(DEFAULT_NODE_VOLUME)

docker.build:
	docker build -t $(IMAGE_NAME) --build-arg USER_ID=$(shell id -u) \
	--build-arg GROUP_ID=$(shell id -g) --build-arg USERNAME=$(USERNAME) \
	-f $(DOCKERFILE_PATH) .

	test -f yarn.lock || docker run --rm -it --name $(CONTAINER_NAME) -p $(PORT):$(PORT) \
		-v `pwd`:/usr/src -v $(DEFAULT_NODE_VOLUME):/usr/src/node_modules $(IMAGE_NAME) \
		yarn generate-lock-entry > yarn.lock

docker.start:
	docker run --rm -it --name $(CONTAINER_NAME) -p $(PORT):$(PORT) \
	-v `pwd`:/usr/src -v $(DEFAULT_NODE_VOLUME):/usr/src/node_modules $(IMAGE_NAME) \
	yarn run start

apv.updateversion:
	docker run --rm -it --name $(CONTAINER_NAME) -p $(PORT):$(PORT) \
	-v `pwd`:/usr/src -v $(DEFAULT_NODE_VOLUME):/usr/src/node_modules $(IMAGE_NAME) \
	yarn apv update $(version)

apv.setstatus:
	docker run --rm -it --name $(CONTAINER_NAME) -p $(PORT):$(PORT) \
	-v `pwd`:/usr/src -v $(DEFAULT_NODE_VOLUME):/usr/src/node_modules $(CONTAINER_NAME) \
	yarn apv update $(status)
