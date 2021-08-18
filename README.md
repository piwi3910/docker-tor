<p align="center">
  <img width="300px" src="https://upload.wikimedia.org/wikipedia/commons/8/8f/Tor_project_logo_hq.png">
</p>

# Docker-tor
![license](https://img.shields.io/badge/license-GPLv3.0-brightgreen.svg?style=flat)
[![Build Status](https://img.shields.io/travis/com/piwi3910/docker-tor/master)](https://travis-ci.com/piwi3910/docker-tor)
[![Docker Hub pulls](https://img.shields.io/docker/pulls/piwi3910/tor-proxy.svg)](https://hub.docker.com/r/piwi3910/tor/)
[![Docker image size](https://img.shields.io/docker/image-size/piwi3910/tor-proxy/latest)](https://hub.docker.com/r/piwi3910/tor/tags)
[![Youtube Channel](https://img.shields.io/youtube/channel/views/UCpNg_I2e8d5_6fU_OOKVG7Q?style=social)](https://www.youtube.com/channel/UCpNg_I2e8d5_6fU_OOKVG7Q)
[![Youtube Subs](https://img.shields.io/youtube/channel/subscribers/UCpNg_I2e8d5_6fU_OOKVG7Q?style=social)](https://www.youtube.com/channel/UCpNg_I2e8d5_6fU_OOKVG7Q?sub_confirmation=1)
[![Discord](https://img.shields.io/discord/719782239466160139)](https://www.youtube.com/channel/UCpNg_I2e8d5_6fU_OOKVG7Q?sub_confirmation=1)

[![Docker Hub badge](http://dockeri.co/image/piwi3910/tor)](https://hub.docker.com/r/piwi3910/tor/)

This container runs a packaged tor socks proxy for the privacy focused individual

## Features

* build from alpine:latest to have the smallest container and smallest attack surface
* Use different ports from standard to not clash with ports on Synology
* Tested on synology :-) but will work elsewhere also
* run with a special "tor_runner" user and not the default tor package user or root
* open up the control port if you want and secure it
* set the control port password on runtime
* weekly rebuild to include the latest alpine updates
* All code provide in Github, so you can build it yourself if you don't trust me (You shouldn't trust anyone with your own privacy!)

Github: [https://github.com/piwi3910/docker-tor](https://github.com/piwi3910/docker-tor)

## Usage

### Socks only - **no** controle port
```
docker run -d --restart=always --name tor-proxy -p 9150:9150 piwi3910/tor-proxy:latest
```

---
### Socks + control port - **default** password
```
docker run -d --restart=always --name tor-proxy -p 9150:9150 -p 9051:9051 piwi3910/tor-proxy:latest
```
*Default control port password:* **my_password**

---
### Socks + control port - **your** password
```
docker run -d --restart=always --name tor-proxy -p 9150:9150 -p 9051:9051 -e control_password=somepassword piwi3910/tor-proxy:latest
```

---
## Web browser config
In your browser go to your proxy config

find socks proxy and fill in the ip of your synology or docker host with port **9150**

`If you run this locally on your pc (localhost) or else the ip of your synology`

## Default TOR settings
* A docker Healthcheck will start running after 60 sec and connect to facebook over tor to verify tor is up and running,
It will restart the container if the tor connection goes down, Make sure to start your container with --restart-always to make sure
tor auto-heals
* tor will try to create an new circuit every 15 sec

happy private browsing!