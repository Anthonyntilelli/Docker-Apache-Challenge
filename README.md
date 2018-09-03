# Docker Apache Challenge - Apache Docker container from a Base OS image

## Table of Contents
1. [Challenge](#Challenge)
1. [Usage: Build](#Usage_BUILD)
1. [Usage: Deploy](#Usage_DEPLOY)
1. [Requirements](#Requirements)
1. [Files](#Files)
1. [Registy](#Registy)

## Challenge:               <a name="Challenge"></a>

  - Create Apache Image from base OS Image
  - Configure https using self signed certificate
    - Do not build the certificates into the Image
  - Configure http redirect to https
  - Configure the http/https homepage to display "Docker Apache Challenge"
  - The Web service should be listening over standard Web ports (80 and 443).
  - Make use of CI tool to:
    - Build docker Images
    - Verify Docker builds
    - Push to GitLab Registy

## Usage: Build                  <a name="Usage_BUILD"></a>

  - `CONTAINER_NAME="name"`
  - `docker build . -t $CONTAINER_NAME`


## Usage: Deploy                 <a name="Usage_DEPLOY"></a>

  - `APA_REDIRECT="127.0.0.1"`
    - set redirect to where you want apache to redirect port 80 connections.
    - Do not include "https" or "http"
  - `APA_CERT="$(pwd)/test"`
    - set to location of the certificate and key
    - Use absolute value location
  - `docker run -p 80:80 -p 443:443 -e "APACHE_REDIRECT_IP=$APA_REDIRECT" --mount type=bind,source="$APA_CERT",target=/cert,readonly $CONTAINER_NAME`

## Requirements:          <a name="Requirements"></a>

  - Docker 18.03
  - Certificate named: domain.crt
  - Certificate key (plain text) named:  domain.key
  - ENV variable: "APACHE_REDIRECT_IP" determines where apache will redirect on port 80

## Registy:                 <a name="Registy"></a>

 - CI Tool builds/pushes GitLab Registy
 - Project permission is required to pull from registry.

## Author:                <a name="Author"></a>
 - Anthony Tilelli
