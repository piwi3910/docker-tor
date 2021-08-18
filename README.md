# Docker-tor

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

## Usage

### Socks only - **no** controle port
```
docker run -p 9150:9150 docker-tor:latest
```

---
### Socks + control port - **default** password
```
docker run -p 9150:9150 -p 9051:9051 docker-tor:latest
```
*Default control port password:* **my_password**

---
### Socks + control port - **your** password
```
docker run -p 9150:9150 -p 9051:9051 -e control_password=somepassword docker-tor:latest
```

---
## Web browser config
In your browser go to your proxy config

find socks proxy and fill in the ip of your synology or docker host with port **9150**

`If you run this locally on your pc (localhost) or else the ip of your synology`


happy private browsing!