DOCKER_DIR=docker
COMPOSE_FILE=$(DOCKER_DIR)/docker-compose.yml

install:
	docker compose \
		--env-file $(DOCKER_DIR)/.env \
		--file $(COMPOSE_FILE) \
		up --detach

test:
	python3 -m venv .venv && source .venv/bin/activate
	pip install -r tests/requirements.txt
	python3 tests/test_mlflow.py

clean:
	(cd docker/; docker compose down; cd ..;)

	rm -rf .venv

all: install test
