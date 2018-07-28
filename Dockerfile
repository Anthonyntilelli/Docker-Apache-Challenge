# Apache Httpd with Static webpage using ALpine Linux

FROM ubuntu

LABEL maintainer="Anthony.n.tilelli@gmail.com"

ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_RUN_USER  www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR   /var/log/apache2

VOLUME /cert

# install/upgrade and update Apache

RUN apt-get update && apt-get install -y apache2

# Clean up install leftovers
RUN apt-get clean && apt-get autoremove && rm -rf /var/lib/apt/lists/* && rm -f /etc/apache2/sites-enabled/000-default.conf

COPY apache_content/index.html /var/www/html/index.html
COPY apache_content/virtualhost.conf /etc/apache2/sites-enabled/000-default.conf

WORKDIR /var/run/apache2

RUN a2enmod ssl

CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]

EXPOSE 80 443
