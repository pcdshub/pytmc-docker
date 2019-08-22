# PYTMC_DOCKER_VERSION=$(shell git describe --tags)
PYTMC_DOCKER_VERSION=v0.0.0

all: image

image:
	docker build -t pytmc:$(PYTMC_DOCKER_VERSION) .


.PHONY: all image
