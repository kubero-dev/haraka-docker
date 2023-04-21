#!/bin/sh

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
