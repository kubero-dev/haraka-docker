#!/bin/sh
# description: Haraka startup and configuration script

/usr/local/bin/haraka-configure --haraka-config-dir /haraka/config --haraka-config-templates-dir /haraka/templates

## start haraka
/usr/local/bin/haraka -c /haraka