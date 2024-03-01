![Banner](./docs/img/project_banner.png)

# mlflow-setup

This repository contains the code for setting up MLFlow Tracking Server with PostgreSQL as backend and MinIO as artifact store, using docker-compose.

## Prerequisites

Docker and docker-compose should be installed on your machine, either through [Docker Desktop](https://www.docker.com/products/docker-desktop/), or its alternatives such as [Orbstack](https://orbstack.dev/)

## Configure environment variables

Make a copy of the `docker/.env.example` file and rename it to `docker/.env`. Then, update the environment variables in the `.env` file as per your requirements.

## Build and start the services

```bash
docker compose up -d --build
```

If everything is setup properly, you should be able to access the services at the following URLs:

- MLFlow Tracking Server: [http://localhost:5000](http://localhost:5000)
- MinIO Console UI: [http://localhost:9001](http://localhost:9001)

![Screenshots](./docs/img/minio_mlflow_screenshot.png)
