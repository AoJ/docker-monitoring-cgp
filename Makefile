# Project: docker monitoring CGP
# Author: AooJ <aooj@n13.cz>
# Date: 2014
# usage:
#	make build	- build new image from Dockerfile
#	make run	- debug run already created image by tag
#	make debug	- build and run bash in docker, dont run /run/start.sh


NAME=aooj/monitoring-cgp
VERSION=1.0
C_NAME=monitoring-cgp
RRD_DATA=rrd-data


build:
	docker build -t $(NAME):$(VERSION) .

run:
	docker run -d -p 443 --name $(C_NAME) --volumes-from $(RRD_DATA) $(NAME):$(VERSION)

data:
	docker run --name $(RRD_DATA) -v /data busybox

debugData:
	docker run -ti --rm --volumes-from $(RRD_DATA) aooj/base /bin/bash

debug: build
	docker run -t -i -p 443:23000 --rm --volumes-from $(RRD_DATA) $(NAME):$(VERSION) /bin/bash

.PHONY: build run debug

