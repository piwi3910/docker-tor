FROM alpine:latest

RUN apk update && \
    apk add --no-cache tor --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted && \
    rm /var/cache/apk/*

EXPOSE 9150 9051

RUN addgroup tor_runner && adduser tor_runner -G tor_runner -D
ADD ./torrc /home/tor_runner/torrc
ADD ./start.sh /home/tor_runner/start.sh
RUN chmod +x /home/tor_runner/start.sh && chown -R tor_runner:tor_runner /home/tor_runner /var/lib/tor

USER tor_runner

ENTRYPOINT ["/home/tor_runner/start.sh"]
