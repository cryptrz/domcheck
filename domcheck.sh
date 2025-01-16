#!/bin/bash

if [ "$#" -ne 1 ]; then
        echo "Usage: $0 example.com"
        exit 1
fi

report="recon_$1_on_$(date +%F_at_%H:%M:%S).txt"

{
        echo $(curl -I -s $1 | grep Server)
        whois $1 | grep "Registrar URL"
        host $1
        dig NS $1  | grep NS | grep -v ";"
        dig CNAME $1  | grep SOA
        dig TXT $1  | grep IN | grep -v ";"
} | tee $report

echo "Report saved in $(pwd)/$report" 
