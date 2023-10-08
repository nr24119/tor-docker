FROM alpine:latest

RUN apk update && apk --no-cache add curl && apk add --no-cache supervisor && apk add tor --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ && rm -rf /var/cache/apk/*
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf 
# EXPOSE 9050
COPY torrc.default /etc/tor/torrc.default
RUN chown -R tor /etc/tor
# USER tor
# ENTRYPOINT [ "tor" ]
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
