#!/bin/sh

## outbound.ini
if [ "$HARAKA_SMTP_OUTBOUND" = "true" ]; then
    echo "disabled=falsed"

    if [ -n "$HARAKA_SMTP_OUTBOUND_CONCURRENCY_MAX" ]; then
        echo "concurrency_max=${HARAKA_SMTP_OUTBOUND_CONCURRENCY_MAX:=100}" >> /haraka/config/outbound.ini
    fi

    if [ "$HARAKA_SMTP_OUTBOUND_ENABLE_TLS" = "false" ]; then
        echo "enable_tls=false" >> /haraka/config/outbound.ini
    fi
    
    if [ -n "$HARAKA_SMTP_OUTBOUND_MAX_TEMP_FAILURS" ]; then 
        echo "maxTempFailures=${HARAKA_SMTP_OUTBOUND_MAX_TEMP_FAILURS:=13}" >> /haraka/config/outbound.ini
    fi
    
    if [ "$HARAKA_SMTP_OUTBOUND_IPV6" = "true" ]; then
        echo "enable_tls=false" >> /haraka/config/outbound.ini
    fi
    
    if [ "$HARAKA_SMTP_OUTBOUND_LOAD_PID_QUEUE" = "true"]; then
        echo "load_pid_queue" >> /haraka/config/outbound.ini
    fi
    
    if [ "$HARAKA_SMTP_OUTBOUND_FLUSH_QUEUE" = "true"]; then
        echo "flush_queue" >> /haraka/config/outbound.ini
    fi

    if [ -n "$HARAKA_SMTP_OUTBOUND_RECIEVED_HEADER" ]; then
        echo "received_header=${HARAKA_SMTP_OUTBOUND_RECIEVED_HEADER:='Haraka recieved it'}" >> /haraka/config/outbound.ini
    fi
fi