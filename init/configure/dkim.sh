#!/bin/sh

## dkim_sign.ini
if [ "$HARAKA_DKIM_SIGN" = "true" ]; then
    echo "
disabled=false
domain=${HARAKA_DKIM_DOMAIN:=example.com}
selector=${HARAKA_DKIM_SELECTOR:=mail}
headers_to_sign=${HARAKA_DKIM_HEADERS_TO_SIGN:="From, Sender, Reply-To, Subject, Date, Message-ID, To, Cc, MIME-Version"}
;key_file=/haraka/config/dkim.key
" >> /haraka/config/dkim_sign.ini
fi

## dkim_verify.ini
if [ "$HARAKA_DKIM_VERIFY" = "true" ]; then
    echo "
; in secs
allowed_time_skew = ${HARAKA_DKIM_ALLOWED_TIME_SKEW:=60}
sigerror_log_level = ${HARAKA_DKIM_SIGERROR_LOG_LEVEL:=info}
" >> /haraka/config/dkim_verify.ini
fi

## WIP ... not sure if needed
: '
## dkim_sign.ini
if [ -z "$HARAKA_DKIM_KEY" ]; then
    echo "No DKIM key found. Generating new key..."
    openssl genrsa -out /haraka/config/dkim.key 2048
    HARAKA_DKIM_KEY=$(cat /haraka/config/dkim.key)
fi

# check if HARAKA_DKIM_DISABLED is set to true
if [ "$HARAKA_DKIM_DISABLED" = "true" ]; then
    echo "DKIM signing is disabled."
    echo "disabled=true" >> /haraka/config/dkim_sign.ini
    exit 0
fi
'
