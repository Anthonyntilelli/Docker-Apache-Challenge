# Docker Apache Challenge - Apache Docker container from a Base OS image

## Table of Contents
1. [Challenge](#Challenge)
1. [Usage](#Usage)
1. [Requirements](#Requirements)
1. [Files](#Files)
1. [Author](#Author)

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
    - Push to Docker Registy
    - Verify the web server is listening on port 443.

## Usage:                 <a name="Usage"></a>

sudo docker build . -t apa5 && sudo docker run -p 80:80 -p 443:443 -e "APACHE_REDIRECT_IP=127.0.0.1"  --mount type=bind,source="$(pwd)"/test,target=/cert,readonly apa5


## Requirements:          <a name="Requirements"></a>

  - Docker 18.03
  - Certificate named: domain.crt
  - Certificate key (plain text) named:  domain.key
  - ENV variable: "APACHE_REDIRECT_IP" determines where apache will redirect on port 80

## Files:                 <a name="Files"></a>



## Author:                <a name="Author"></a>
 - Anthony Tilelli
