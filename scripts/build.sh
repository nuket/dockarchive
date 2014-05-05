#!/bin/bash
# Args that start with -D are for GPP, all others are passed onto docker
GPP_ARGS=
DOCKER_ARGS=
while test ${#} -gt 0
do
  if [[ $1 == -D* ]] ; then
    GPP_ARGS="$GPP_ARGS $1"
  else
    DOCKER_ARGS="$DOCKER_ARGS $1"
  fi 
  shift
done
TOPDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"
IMG_NAME=`readlink -f . | xargs basename`
USER_ID=$(<${TOPDIR}/baselines/UserId)

rm -rf ./build ; mkdir ./build

echo Building $USER_ID/$IMG_NAME...
echo 

# Using GPP preprocessor to produce Dockerfile, configured so that :
# Macros and meta-macros like '#macro' or '#macro(arg1, arg2)'
# Line-comments begin with '##'
# '##'as a last character of a line will remove newline from output.
# Comments start with '#*' and end with '*#'
# The escape character is '~', '~~' will produce '~'.
gpp -U "#" "" "(" "," ")" "(" ")" "#" "~" +c "##" "\n" +c "#*" "*#" -I${TOPDIR} -o build/Dockerfile -x -DTOPDIR=${TOPDIR} ${GPP_ARGS} Dockerfile.in 
if [ $? -gt 0 ]; then
    exit 1
fi

# Docker build, removing intermediate containers
docker build --rm=true --tag="$USER_ID/$IMG_NAME" $DOCKER_ARGS build
