#!/bin/sh

cd /var/www/html/OMB100/propel/omelhor_internacional && ../vendor/bin/propel migrate --force -q
cd /var/www/html/OMB100/propel/omelhor_bairro && ../vendor/bin/propel migrate --force -q
