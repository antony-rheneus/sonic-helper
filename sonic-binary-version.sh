#!/bin/sh 

#Usage 
# sonic-binary-version.sh <path/to/file/sonic-broadcom.bin>


if [ -z "$1" ]; then
   echo "Usage: $0 <path/to/file/sonic-ASICNAME.bin>"
   exit 1
fi

if [ ! -f $1 ]; then
   echo "Error: File not found $1"
   exit 2
fi

echo
cat -v $1 | grep -m 1 ^image_version  | sed -n  "s/^image_version=\"\(.*\)\"$/SONiC-OS-\1/p"

echo
