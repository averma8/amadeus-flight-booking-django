PORTS = -p 8000:8000
ENV = \
  -e AMADEUS_CLIENT_ID=${Hn6rSUHMpWfRX5m0nYMnrD9Ic3UyLgVm} \
  -e AMADEUS_CLIENT_SECRET=${hI5TAJjYqULTBhKV} \
  -e AMADEUS_HOSTNAME=test

NS ?= amadeus4dev
VERSION ?= latest

IMAGE_NAME ?= flight-booking
CONTAINER_NAME ?= flight-booking
CONTAINER_INSTANCE ?= default

build: Dockerfile
	docker build -t $(NS)/$(IMAGE_NAME):$(VERSION) -f Dockerfile .

run:
	docker run --rm -i -t --name $(CONTAINER_NAME)-$(CONTAINER_INSTANCE) \
		$(PORTS) \
		$(ENV) \
		$(NS)/$(IMAGE_NAME):$(VERSION)

start:
	docker run -d --name $(CONTAINER_NAME)-$(CONTAINER_INSTANCE) \
		$(PORTS) \
		$(ENV) \
		$(NS)/$(IMAGE_NAME):$(VERSION)

stop:
	docker stop $(CONTAINER_NAME)-$(CONTAINER_INSTANCE)

rm:
	docker rm $(CONTAINER_NAME)-$(CONTAINER_INSTANCE)

default: build

.PHONY: build run start stop rm
