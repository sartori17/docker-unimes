#!/bin/bash

# Apache gets grumpy about PID files pre-existing
rm -f /var/run/apache2/apache2.pid && \
sed -i "s|DOCUMENT_ROOT|$DOCUMENT_ROOT|g" /etc/apache2/sites-available/000-default.conf && \
sed -i "s|ENVIRONMENT_VAR|$ENVIRONMENT|g" /etc/apache2/sites-available/000-default.conf && \
/usr/sbin/apache2ctl -D FOREGROUND