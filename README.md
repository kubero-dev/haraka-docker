# Haraka MTA (WIP)

> **Warning**
> This image is under development and not ready for production use.

Haraka is a fast, lightweight, and easy to configure SMTP server. It is written in Node.js and is designed to be easy to configure and extend. 

The Goal of this project is to provide a simple way to deploy Haraka with Docker.

## Usage

### Pull Image 
```bash
docker run --env-file .env -p 8025:8025 --name haraka ghcr.io/kubero-dev/haraka:latest
```

### Docker Compose

The easiest way to get started is to use the provided docker-compose.yml file.
Make sure you have created tht tls secrets as described in the config/README.md file.
```bash
docker-compose up -d
```
