#!/bin/bash
TOPDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"
IMG_NAME=`readlink -f . | xargs basename`
USER_ID=$(<${TOPDIR}/baselines/UserId)
echo Building $USER_ID/$IMG_NAME...
echo 
# -C is required not to interpret // as a comment to be removed. Sadly, /* is still an issue... 
cpp -C -I${TOPDIR} Dockerfile.in -o Dockerfile $@
if [ $? -gt 0 ]; then
    exit 1
fi
docker build --rm=true --tag="$USER_ID/$IMG_NAME" .
if [ $? -gt 0 ]; then
    exit 1
fi
