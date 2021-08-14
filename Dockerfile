FROM piwi3910/base:alpine_latest

RUN apk update && \
    apk add --no-cache tor --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted && \
    rm /var/cache/apk/*

EXPOSE 9150

ADD ./torrc /etc/tor/torrc

USER tor
CMD /usr/bin/tor -f /etc/tor/torrc