#!/bin/bash
print_help(){
  echo "Usage: ./run.sh <petalinux|vnc>"
  exit 1
}

if [ -z $1 ]; then
  print_help
fi

IMAGE=petalinux:latest
NAME=petalinux
WORKDIR=/home/petalinux
NETWORK_VOLUME="-v $PWD/workspace:/home/petalinux/workspace"

if [ $1 == "vnc" ]; then
  docker run --rm -p 5901:5901 \
    --entrypoint=/bin/bash \
    --workdir=$WORKDIR --user=root --name=$NAME -it $NETWORK_VOLUME $IMAGE \
    -c "export USER=root && rm /tmp/.X1-lock && /usr/bin/vncserver :1 -geometry 1280x800 -depth 24 && tail -f /root/.vnc/*:1.log"
elif [ $1 == "petalinux" ]; then
  docker run --rm -p 5901:5901 \
    --entrypoint=/bin/bash --workdir=$WORKDIR/workspace --user=petalinux --name=$NAME -it $NETWORK_VOLUME $IMAGE
else
  print_help
fi
