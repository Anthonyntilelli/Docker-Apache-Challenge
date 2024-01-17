# Example Docker and Github Actions

Demo creating an Apache docker container from a Base OS image, uploaded to github via github actions

## Table of Contents

1. [Demo](#Demo)
2. [Usage: Build](#Usage_BUILD)
3. [Usage: Deploy](#Usage_DEPLOY)
4. [Requirements](#Requirements)
5. [Registry](#Registry)

## Demo: <a name="Demo"></a>

- Create Apache Image from base OS Image
- Configure https using self signed certificate
  - Do not build the certificates into the Image
- Configure http redirect to https
- Configure the http/https homepage to display "Docker Apache Challenge"
- The Web service should be listening over standard Web ports (80 and 443).
- Make use of CI tool to:
  - Build docker Images
  - Verify Docker builds
  - Push to GitLab Registry

## Usage: Build <a name="Usage_BUILD"></a>

- `CONTAINER_NAME="name"`
- `docker build . -t $CONTAINER_NAME`

## Usage: Deploy <a name="Usage_DEPLOY"></a>

- `APA_REDIRECT="127.0.0.1"`
  - set redirect to where you want apache to redirect port 80 connections.
  - Do not include "https" or "http"
- `APA_CERT="$(pwd)/test"`
  - set to location of the certificate and key
  - Use absolute value location
- `docker run -p 80:80 -p 443:443 -e "APACHE_REDIRECT_IP=$APA_REDIRECT" --mount type=bind,source="$APA_CERT",target=/cert,readonly $CONTAINER_NAME`

## Requirements: <a name="Requirements"></a>

- Docker
- Certificate named: domain.crt
- Certificate key (plain text) named: domain.key
- ENV variable: "APACHE_REDIRECT_IP" determines where apache will redirect on port 80

## Registry: <a name="Registry"></a>

- CI Tool builds/pushes GitHub Registry
- Project permission is required to pull from registry.

## Author: <a name="Author"></a>

- Anthony Tilelli
