#!make
PROJECT_VERSION := 0.5

SHELL := /bin/bash
IMAGE := tschm/docker

.PHONY: help build jupyter tag hub slides clean


.DEFAULT: help

help:
	@echo "make build"
	@echo "       Build the docker image."
	@echo "make jupyter"
	@echo "       Start the Jupyter server."
	@echo "make tag"
	@echo "       Make a tag on Github."
	@echo "make hub"
	@echo "       Push Docker Image to DockerHub."


build:
	docker-compose build jupyter

buildlab:
	docker-compose build jupyterlab

jupyter: build
	echo "http://localhost:5555"
	docker-compose up jupyter

jupyterlab: buildlab
	echo "http://localhost:5555/lab"
	docker-compose up jupyterlab

tag:
	git tag -a ${PROJECT_VERSION} -m "new tag"
	git push --tags

#hub: tag
#	docker build --tag ${IMAGE}:latest --target=jupyterlab .
#	docker push ${IMAGE}:latest
#	docker tag ${IMAGE}:latest ${IMAGE}:${PROJECT_VERSION}
#	docker push ${IMAGE}:${PROJECT_VERSION}
#	docker rmi -f ${IMAGE}:${PROJECT_VERSION}
