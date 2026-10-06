.PHONY: help test build clean

SERVICE_NAME ?= "passthrough-processor"

.DEFAULT: help

help:
	@echo "Make Help for $(SERVICE_NAME)"
	@echo ""
	@echo "make build   - build the Docker image"
	@echo "make test    - run the processor locally via docker-compose"
	@echo "make clean   - remove output files and stop containers"

build:
	docker compose build

test:
	docker compose down --remove-orphans
	docker compose build
	docker compose up --exit-code-from processor

clean:
	docker compose down --remove-orphans
	rm -rf data/output/*
