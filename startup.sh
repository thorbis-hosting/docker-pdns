#!/bin/sh

/usr/local/bin/ParseConfig /app/pdns.conf /etc/pdns/pdns.conf

/usr/sbin/pdns_server --daemon=no
