FROM alpine:latest
ADD hostname.sh /

EXPOSE 9050 9051 80
RUN apk add --no-cache tor nginx

COPY nginx.conf /etc/nginx/
COPY index.html /www/
RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
RUN rc-service nginx start

COPY torrc /etc/tor/
RUN chown -R tor /etc/tor
USER tor
CMD tor -f /etc/tor/torrc
RUN ["hostname.sh", "created hostname.txt"]

