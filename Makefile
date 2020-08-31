#!make
PROJECT_VERSION := 1.3.0

SHELL := /bin/bash

.PHONY: help build jupyter jupyterlab tag


.DEFAULT: help

help:
	@echo "make build"
	@echo "       Build the docker image."
	@echo "make jupyter"
	@echo "       Start the Jupyter server."
	@echo "make tag"
	@echo "       Make a tag on Github."

build:
	docker-compose build jupyter

jupyter: build
	echo "http://localhost:8888/tree"
	docker-compose up jupyter

jupyterlab: build
	echo "http://localhost:8888/lab"
	docker-compose up jupyter

tag:
	git tag -a ${PROJECT_VERSION} -m "new tag"
	git push --tags
