# Docker Collectd Graph Panel ([CGP](https://github.com/pommi/CGP))

## Quick Start
* Create the `$RRD_DATA` volume container, i.e. `RRD_DATA="rrd-data"`. Rdd files is in /data/rrd

    docker run --name $RRD_DATA -v /data busybox
* run data collector od fill up data container
    docker run -d --name collectd-server --volumes-from rrd-data -p 25827:25827/udp aooj/collectd-server


## Usage

### in Dockerfile
    FROM aooj/monitorin-cgp:latest

### build
    git clone https://github.com/AoJ/docker-monitoring-cgp.git
    make build
    
### and start it
    make run

### or build, start and attach
    make debug

    
## Changelog
- 1.0 first realese
