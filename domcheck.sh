#!/bin/bash

if [ "$#" -ne 1 ]; then
        echo "Usage: $0 example.com"
        exit 1
fi

report="recon_$1_on_$(date +%F_at_%H:%M:%S).txt"

{
        echo $(curl -I -s $1 | grep Server)
        host $1
        dig CNAME $1 | grep SOA
        dig TXT $1 | grep IN
} > $report

echo "Report saved in $(pwd)/$report" 
