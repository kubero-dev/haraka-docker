#!/bin/sh
# description: Haraka startup and configuration script

## host_list
# Split Hostname from HARAKA_HOSTLIST env variable and create host_list
> /haraka/config/host_list
for i in $(echo ${HARAKA_HOSTLIST:=localhost} | sed "s/,/\n/g") ; do
    echo $i >> /haraka/config/host_list
done

## smtp.ini
sed -i "s/;nodes=cpus/nodes=cpus/g" /haraka/config/smtp.ini
sed -i "s/;listen=\[::0\]:25/listen=[::0]:${HARAKA_SMPT_PORT:=8025}/g" /haraka/config/smtp.ini

## log.ini
sed -i "s/level=info/level=${HARAKA_LOG_LEVEL:=debug}/g" /haraka/config/log.ini
sed -i "s/timestamps=false/timestamps=${HARAKA_LOG_TIMESTAMP:=false}/g" /haraka/config/log.ini
sed -i "s/format=default/format=${HARAKA_LOG_FORMAT:=default}/g" /haraka/config/log.ini

## me
echo ${HARAKA_ME:=mynameisnobody} > /haraka/config/me

## plugins
> /haraka/config/plugins
for i in $(echo $HARAKA_PLUGINS | sed "s/,/\n/g") ; do
    echo $i >> /haraka/config/plugins
done

source /usr/local/bin/configure/helo.checks.sh

## smtp_forward.ini
if [ "$HARAKA_SMTP_FORWARD" = "true" ]; then
    echo "
host=${HARAKA_SMTP_FORWARD_HOST:=localhost}
port=${HARAKA_SMTP_FORWARD_PORT:=2555}
enable_tls=${HARAKA_SMTP_FORWARD_ENABLE_TLS:=false}
enable_outbound=${HARAKA_SMTP_ENABLE_OUTBOUND:=true}" >> /haraka/config/smtp_forward.ini
fi

source /usr/local/bin/configure/outbound.sh

## relay.ini
echo "
[relay]
all=true 
" >> /haraka/config/relay.ini


source /usr/local/bin/configure/dkim.sh

## start haraka
/usr/local/bin/haraka -c /haraka