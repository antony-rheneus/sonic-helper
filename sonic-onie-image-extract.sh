#!/bin/sh

set -e 

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

# sed -n '1,/^exit_marker$/p' $1  > $F.install.sh

echo "Disclosed $0 binary image to tar $F.extracted.tar"

mkdir -p "$F_extracted"
tar -C "$F_extracted" -xf "$F.extracted.tar"

echo "Extracted $0 binary image to dir $F.extracted/"



