FROM debian:jessie
MAINTAINER Alexander Schenkel <alex@alexi.ch>

RUN apt-get update && \
    apt-get install -y \
      locales \
      apache2 \
      php5 \
      php5-cli \
      libapache2-mod-php5 \
      php5-gd \
      php5-json \
      php5-ldap \
      php5-mysql \
      php5-pgsql \
      vim

COPY apache_default /etc/apache2/sites-available/000-default.conf
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
RUN a2enmod rewrite

EXPOSE 80
ENTRYPOINT ["/entrypoint.sh"]

LABEL org.opencontainers.image.source https://github.com/zixia/docker-apache-php56