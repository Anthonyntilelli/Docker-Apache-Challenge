# Apache Httpd with Static webpage
FROM debian:12-slim

LABEL maintainer="Anthony@Tilelli.me"

ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_RUN_USER  www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR  /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2$SUFFIX/apache2.pid

VOLUME /cert
# Expecting certificate (domain.crt)  and Private key (domain.key)

# Install Apache and clean up Apt
RUN apt-get update && apt-get install -y --no-install-recommends apache2=2.4.57-2 && apt-get clean && rm -rf /var/lib/apt/lists/*

# Setup Apache
RUN rm -f /etc/apache2/sites-enabled/000-default* && mkdir -p /var/run/apache2 && a2enmod ssl
COPY apache_content/index.html /var/www/html/index.html
COPY apache_content/virtualhost.conf /etc/apache2/sites-enabled/000-default.conf

EXPOSE 80 443

CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
