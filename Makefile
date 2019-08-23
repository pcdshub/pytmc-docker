PYTMC_DOCKER_VERSION=$(shell git describe --tags)

all: image

image:
	docker build -t pcdshub/pytmc:$(PYTMC_DOCKER_VERSION) .

push:
	docker push pcdshub/pytmc:$(PYTMC_DOCKER_VERSION)


.PHONY: all image push
