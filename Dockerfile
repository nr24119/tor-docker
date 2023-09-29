FROM alpine:latest

EXPOSE 9050 9051 80
RUN apk add --no-cache tor nginx openrc

COPY torrc /etc/tor/
RUN chown -R tor /etc/tor
USER tor
CMD tor -f /etc/tor/torrc

COPY hostname.sh /
COPY nginx.conf /etc/nginx/
RUN hostname.sh
COPY index.html /www/
RUN adduser -D -g 'www' www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
RUN rc-service nginx start

# docker build --no-cache -t tor-docker 
