# partially taken from https://github.com/FriendlyAdmin/onionbalance/blob/master/Dockerfile
FROM alpine:latest

RUN apk update && apk --no-cache upgrade && apk --no-cache add nginx tini supervisor && apk add tor && apk add --virtual .build-deps \
        git \
        gcc \
        musl-dev \
        python3-dev \
        libffi-dev \
        openssl-dev \
        && \
    # Download Onionbalance.
    git clone https://github.com/nr24119/onionbalance.git && \
    # Build Onionbalance.
    cd onionbalance && \
    git checkout dev
    python setup.py install && \
    # Remove dependencies.
    apk --no-cache del .build-deps && \
    # Delete apk cache to save some space.
    rm -rf /var/cache/apk/*
    
COPY supervisord.conf /etc/supervisord.conf 
COPY nginx.conf /etc/nginx/nginx.conf

COPY torrc.default /etc/tor/torrc.default
COPY index.html /var/lib/nginx/html/index.html
RUN chown -R tor /etc/tor

ENTRYPOINT [ "/sbin/tini", "--" ]
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
