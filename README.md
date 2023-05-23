# Docker image for Haraka Mail Server (WIP)

> **Warning**
> This image is under development and not ready for production use.

Haraka is a fast, lightweight, and easy to configure SMTP server. It is written in Node.js and is designed to be easy to configure and extend. 

The Haraka Node.js Mail Server can be found here: https://github.com/haraka/Haraka 

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

### Usage
From helm repository
```bash
helm repo add haraka https://haraka.kubero.dev 
helm install haraka haraka/haraka
helm upgrade haraka haraka/haraka
```


From source
```bash
git clone 
cd haraka-docker
helm install haraka charts/haraka
helm upgrade haraka charts/haraka
```

## Configuration
| File | ENV | Default | Required |
| ---- | --- | ------- | :------: |
| host_list | HARAKA_HOSTLIST | localhost | x |
| log.ini | HARAKA_LOG_LEVEL | data,protocol,debug,**info**,notice,warn,error,crit,alert,emerg |   |
| log.ini | HARAKA_LOG_TIMESTAMPS | false |   |
| log.ini | HARAKA_LOG_FORMAT | **default**,logfmt,json |   |
| me | HARAKA_ME | mynameisnobody | x |
| outbound.ini | HARAKA_SMTP_OUTBOUND | false |   |
| outbound.ini | HARAKA_SMTP_OUTBOUND_CONCURRENCY_MAX | 100 |   |
| outbound.ini | HARAKA_SMTP_OUTBOUND_TLS | false |   |
| outbound.ini | HARAKA_SMTP_OUTBOUND_MAX_TEMP_FAILURES | 13 |   |
| outbound.ini | HARAKA_SMTP_OUTBOUND_IPV6 |   |   |
| outbound.ini | HARAKA_SMTP_OUTBOUND_LOAD_PID_QUEUE |   |   |
| outbound.ini | HARAKA_SMTP_OUTBOUND_FLUSH_QUEUE |   |   |
| outbound.ini | HARAKA_SMTP_OUTBOUND_RECEIVED_HEADER | false |   |
| outbound.ini | HARAKA_SMTP_OUTBOUND_RECEIVED_HEADER | Haraka outbound |   |
| smtp.ini | HARAKA_SMTP_LISTEN | [::0]:8025 |   |
| smtp.ini | HARAKA_SMTP_PUBLIC_IP |   |   |
| smtp.ini | HARAKA_SMTP_INACTIVITY_TIMEOUT |   |   |
| smtp.ini | HARAKA_SMTP_USER |   |   |
| smtp.ini | HARAKA_SMTP_GROUP |   |   |
| smtp.ini | HARAKA_SMTP_IGNORE_BAD_PLUGINS |   |   |
| smtp.ini | HARAKA_SMTP_FORCE_SHUTDOWN_TIMEOUT | 30 |   |
| smtp.ini | HARAKA_SMTP_STRICT_RFC1869 | false |   |
| smtp.ini | HARAKA_SMTP_SMTPUTF8 | false |   |
| smtp.ini | HARAKA_SMTP_ADD_RECEIVED | false |   |
| smtp.ini | HARAKA_SMTP_CLEAN_AUTH_RESULTS | false |   |
| smtp.ini | HARAKA_SMTP_SHOW_VERSION | false |   |
| smtp.ini | HARAKA_SMTP_MAX_HEADER_LINES | 1000 |   |
| smtp.ini | HARAKA_SMTP_MAX_RECEIVED_COUNT | 100 |   |
| smtp_forward.ini | HARAKA_SMTP_FORWARD_HOST | localhost |   |
| smtp_forward.ini | HARAKA_SMTP_FORWARD_PORT | 2555 |   |
| smtp_forward.ini | HARAKA_SMTP_FORWARD_ENABLE_TLS | false |   |
| smtp_forward.ini | HARAKA_SMTP_FORWARD_ONE_MESSAGE_PER_RCPT | false |   |
| smtp_forward.ini | HARAKA_SMTP_AUTH_TYPE | plain |   |
| smtp_forward.ini | HARAKA_SMTP_AUTH_USER |   |   |
| smtp_forward.ini | HARAKA_SMTP_AUTH_PASS |   |   |
| smtp_forward.ini | HARAKA_SMTP_ENABLE_OUTBOUND | false |   |