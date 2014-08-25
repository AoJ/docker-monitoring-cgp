# Docker monitoring CGP
#
# VERSION 1.0

FROM aooj/php54:latest

MAINTAINER AooJ "aoj@n13.cz"

# keep up to date
RUN apt-get update && apt-get upgrade -y && apt-get clean

ADD files/install.sh /tmp/install.sh
RUN /tmp/install.sh
RUN rm /tmp/install.sh
ADD files/config.local.php /var/www/conf/config.local.php
RUN mkdir /var/lib/collectd


VOLUME ["/var/lib/collectd"]
