FROM debian:jessie
MAINTAINER Huan <zixia@zixia.net>

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

COPY entrypoint.sh        /
COPY apache-default.conf /etc/apache2/sites-available/000-default.conf
RUN a2enmod rewrite

EXPOSE 80
ENTRYPOINT ["/entrypoint.sh"]

LABEL org.opencontainers.image.source https://github.com/zixia/docker-apache-php56
