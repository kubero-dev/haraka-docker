#!/bin/sh
# description: Haraka startup and configuration script

## host_list
# Split Hostname from HARAKA_HOSTLIST env variable and create host_list
# HARAKA_HOSTLIST="example.org,test.com"
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

## helo.checks
> /haraka/config/helo.checks
echo "[check]" >> /haraka/config/helo.checks
for i in $(echo $HARAKA_HELO_CHECKS_CHECK | sed "s/,/\n/g") ; do
    echo $i >> /haraka/config/helo.checks
done

echo "" >> /haraka/config/helo.checks

echo "[reject]" >> /haraka/config/helo.checks
for i in $(echo $HARAKA_HELO_CHECKS_REJECT | sed "s/,/\n/g") ; do
    echo $i >> /haraka/config/helo.checks
done

echo "" >> /haraka/config/helo.checks

echo "[skip]" >> /haraka/config/helo.checks
for i in $(echo $HARAKA_HELO_CHECKS_SKIP | sed "s/,/\n/g") ; do
    echo $i >> /haraka/config/helo.checks
done

echo "" >> /haraka/config/helo.checks

echo "
[bigco]
msn.com=msn.com
hotmail.com=hotmail.com
yahoo.com=yahoo.com,yahoo.co.jp
yahoo.co.jp=yahoo.com,yahoo.co.jp
yahoo.co.uk=yahoo.co.uk
excite.com=excite.com,excitenetwork.com
mailexcite.com=excite.com,excitenetwork.com
yahoo.co.jp=yahoo.com,yahoo.co.jp
mailexcite.com=excite.com,excitenetwork.com
aol.com=aol.com
compuserve.com=compuserve.com,adelphia.net
nortelnetworks.com=nortelnetworks.com,nortel.com
earthlink.net=earthlink.net
earthling.net=earthling.net
google.com=google.com
gmail.com=google.com,gmail.com
" >> /haraka/config/helo.checks

```
## smtp_forward.ini
echo "
host=localhost
port=2555
enable_tls=false
enable_outbound=true" >> /haraka/config/smtp_forward.ini


## outbound.ini
echo "
disabled=false
enable_tls=false
maxTempFailures=3
load_pid_queue
flush_queue
received_header=Haraka lala
" >> /haraka/config/outbound.ini
```

## start haraka
/usr/local/bin/haraka -c /haraka