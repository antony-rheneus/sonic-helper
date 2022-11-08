#!/bin/sh

#Usage 
# sonic-onie-image-extract.sh <path/to/file/sonic-broadcom.bin>


if [ -z "$1" ]; then
   echo "Usage: $0 <path/to/file/sonic-ASICNAME.bin>"
   exit 1
fi

if [ ! -f $1 ]; then
   echo "Error: File not found $1"
   exit 2
fi

echo

F=`basename $1`
sed -e '1,/^exit_marker$/d' $1 > $F.extracted.tar
