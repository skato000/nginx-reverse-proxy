#!/bin/sh

rm /etc/nginx/conf.d/default.conf || rm /etc/nginx/nginx.conf || :
cp nginx.conf /etc/nginx/nginx.conf
envsubst < default.conf > /etc/nginx/conf.d/default.conf
envsubst < .htpasswd > /etc/nginx/.htpasswd

exec nginx -g "daemon off;"