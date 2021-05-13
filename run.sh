#!/usr/bin/env bash

#export XAUTH_TOKEN=`xauth list`
#docker build --build-arg "XAUTH_TOKEN=$XAUTH_TOKEN" -t dockerfox_gui .

docker run -ti \
    --rm \
    --name dockerfox \
    --network host \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY \
    dockerfox_gui bash
# Couldn't make it work!
#    -v $XAUTHORITY:$XAUTHORITY \
#    -e XAUTHORITY \
