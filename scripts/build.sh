#!/bin/bash
MYDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"
IMG_NAME=`readlink -f . | xargs basename`
echo Building $MYDIR/$IMG_NAME...
echo 
cpp -I${MYDIR} -CC -DENABLE_APT_CACHE Dockerfile.in -o Dockerfile
if [ $? -gt 0 ]; then
    exit 1
fi
docker build --rm=true --tag="$MYDIR/$IMG_NAME" .
if [ $? -gt 0 ]; then
    exit 1
fi



