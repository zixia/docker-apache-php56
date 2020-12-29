apache-php56
===================================

A Docker image based on Debian Jessie, serving PHP 5.6 running as Apache Module. Useful for Web developers in need for a fixed PHP version. In addition, the `error_reporting` setting in php.ini is configurable per container via environment variable.

Tags
-----

* latest: Debian 8 (Jessie), Apache 2.4, PHP 5.6.x with support for setting `error_reporting`

Usage
------

```
$ docker run -d -P bylexus/apache-php56
```

With all the options:

```bash
$ docker run -d -p 8080:80 \
    -v /home/user/webroot:/var/www \
    -e PHP_ERROR_REPORTING='E_ALL & ~E_STRICT' \
    bylexus/apache-php56
```

* `-v [local path]:/var/www` maps the container's webroot to a local path
* `-p [local port]:80` maps a local port to the container's HTTP port 80
* `-e PHP_ERROR_REPORTING=[php error_reporting settings]` sets the value of `error_reporting` in the php.ini files.

### Access apache logs

Apache is configured to log both access and error log to STDOUT. So you can simply use `docker logs` to get the log output:

`docker logs -f container-id`


Installed packages
-------------------

* Debian 8 (jessie)
* locales
* apache2
* php5
* php5-cli
* libapache2-mod-php5
* php5-gd
* php5-json
* php5-ldap
* php5-mysql
* php5-pgsql
* vim

Configurations
----------------

* Apache: .htaccess-Enabled in webroot (mod_rewrite with AllowOverride all)
* php.ini:
  * display_errors = On
  * error_reporting = E_ALL (default, overridable per env variable)

Onbuild
--------

We have a image with `ONBUILD` for convenience.

1. `apache_default`: will copy to `/etc/apache2/sites-available/000-default.conf`
1. `webroot/`: will copy to `/webroot`
1. `VERSION`: will copy to `/webroot`

Then you will only need one line for your Dockerfile:

```dockerfile
FROM ghcr.io/zixia/apache-php56:onbuild
```

Example: [onbuild-example](onbuild-example/)

History
--------

### v0.1 (Dec 29, 2020)

1. `ONBULD` support by Huan
1. Forked from <https://github.com/bylexus/docker-apache-php56>


Motivation
------------

To create this `ONBUILD` image is because that I have to restore serval very old LAMP websites, like [17SALSA](https://17salsa.com)([repo](https://github.com/zixia/17salsa.com)), [CEIBS Mobi Club](https://ceibsmobi.com)([repo](https://github.com/zixia/ceibsmobi.com)), etc.

The old website are totally a mess, and what I want to is to use Git to manage the code, all the data stored in a data disk on Azure, and using an Azure MySQL database instance with DevOps from GitHub Action.

When I split the source code out of the website and trying to use `bylexus/apache-php56` I found that it will be easier to use if we can have a `ONBULD` image.

That's my story of this repo.

Huan, Dec 29, 2020

Credit
--------

This repo is forked from <https://github.com/bylexus/docker-apache-php56> and tuned for better needs of [@huan](https://github.com/huan)

Maintainer
------------

[Huan](https://github.com/huan) [(李卓桓)](https://linkedin.com/in/zixia), SYSOP of zixia.net <zixia@zixia.net>

[![Profile of Huan LI (李卓桓) on StackOverflow](https://stackoverflow.com/users/flair/1123955.png)](https://stackoverflow.com/users/1123955/huan)

Copyright & License
---------------------

- Code & Docs © 2020-2021 zixia.net
- Code released under the Apache-2.0 License
- Docs released under Creative Commons
