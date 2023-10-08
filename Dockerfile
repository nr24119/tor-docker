FROM alpine:latest

RUN apk update && apk --no-cache upgrade && apk --no-cache add nginx tini supervisor && apk add tor --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ && rm -rf /var/cache/apk/*
COPY supervisord.conf /etc/supervisord.conf 
COPY nginx.conf /
# EXPOSE 9050
COPY torrc.default /etc/tor/torrc.default
RUN chown -R tor /etc/tor
# USER tor
ENTRYPOINT [ "/sbin/tini", "--" ]
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
