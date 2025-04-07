FROM nginx:alpine

ENV HTPASSWD='foo:$apr1$odHl5EJN$KbxMfo86Qdve2FH4owePn.' \
    FORWARD_HOST=web \
    FORWARD_PORT=80 \
    FORWARD_API_HOST=api \
    FORWARD_API_PORT=80

WORKDIR /opt

RUN apk add --no-cache gettext

COPY default.conf nginx.conf .htpasswd launch.sh ./

# make sure root login is disabled
RUN sed -i -e 's/^root::/root:!:/' /etc/shadow

CMD ["./launch.sh"]