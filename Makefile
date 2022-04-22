STAMP:=$(shell date +'%Y%m%d.%H')
TAG=xrobau/atlassian-base:$(STAMP)

.PHONY: help
help:
	@echo "This simply builds the atlassian base package"
	@echo "Run 'make build' to create it and then 'make push' to send it to docker"
	@echo "hub. Obviously, you can't send it if you're not xrobau. Are you xrobau?"

build: .docker_build_$(STAMP)

.docker_build_$(STAMP): $(wildcard docker/*)
	docker build --tag $(TAG) docker/
	touch $@

.PHONY: push
push: .docker_build_$(STAMP)
	docker push $(TAG)

