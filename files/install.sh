#!/usr/bin/env bash

apt-get install -y rrdtool && apt-get clean
rm /var/www -rf
/usr/bin/git clone https://github.com/pommi/CGP.git /var/www
