# Dockerized PHP, MySQL, and MongoDB System
---

## ⚠️ Warning

This setup has been **tested on a Mac system with M1/M2 (Apple Silicon) architecture**. While it uses Docker's multi-platform image support and should work seamlessly on x86-based systems (Intel/AMD), some edge cases may require adjustments.

---
## Prerequisites
- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Setup Instructions

### Build and Run the Containers

```bash
docker-compose build --build-arg DEV_MODE=true
docker-compose up
```

## Switching Between Development and Production Modes

### Development Mode: Includes PHP Xdebug.
```bash
docker-compose build --build-arg DEV_MODE=true
docker-compose up
```

### Production Mode: Runs PHP without Xdebug.
```bash
docker-compose build --build-arg DEV_MODE=false
docker-compose up
```

## Stopping and delete the Containers

```bash
docker-compose down
```

## Access the System
Open a browser and navigate to http://localhost:8080

PHP Info http://localhost:8080/phpinfo.php