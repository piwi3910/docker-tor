FROM alpine:3.14

LABEL maintainer="Pascal Watteel <pascal@watteel.be>"
LABEL name="tor-proxy"
LABEL version="latest"

RUN apk update && \
    apk add --no-cache zstd-libs=1.5.0-r0 --repository http://dl-cdn.alpinelinux.org/alpine/edge/main/ --allow-untrusted && \
    apk add --no-cache tor --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted && \
    rm /var/cache/apk/*

EXPOSE 9150 9051

RUN addgroup tor_runner && adduser tor_runner -G tor_runner -D
ADD ./torrc /home/tor_runner/torrc
ADD ./start.sh /home/tor_runner/start.sh
RUN chmod +x /home/tor_runner/start.sh && chown -R tor_runner:tor_runner /home/tor_runner /var/lib/tor

HEALTHCHECK --timeout=10s --start-period=60s \
    CMD curl --fail --socks5-hostname localhost:9150 -I -L 'https://www.facebookwkhpilnemxj7asaniu7vnjjbiltxjqhye3mhbshg7kx5tfyd.onion/' || exit 1

USER tor_runner

ENTRYPOINT ["/home/tor_runner/start.sh"]
