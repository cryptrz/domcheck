#!/bin/bash

if [ "$#" -ne 1 ]; then
        echo "Usage: $0 example.com"
        exit 1
fi

curl -I -s $1 | grep Server
host $1
dig CNAME $1 | grep IN
dig TXT $1 | grep IN
