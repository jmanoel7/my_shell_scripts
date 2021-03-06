#!/bin/bash

stop() {
    if [ -f ~/.vnc/x11vnc.pid ]; then
        kill -9 "$(cat ~/.vnc/x11vnc.pid)"
        rm ~/.vnc/x11vnc.pid
    fi
}

start () {
    cd ~
    exec x11vnc \
        -http_ssl \
        -ssl SAVE \
        -env SSL_INIT_TIMEOUT=300 \
        -ssltimeout 360000 \
        -display :0 \
        -forever \
        -usepw \
        -rmflag create:/home/joaomanoel/.vnc/x11vnc.pid \
        -httpdir /usr/share/x11vnc/classes/ssl \
        -httpport 57100 \
        -rfbport 56100
}

if [ "X${1}X" = "XstartX" ]; then
    stop
    sleep 1
    start
elif [ "X${1}X" = "XstopX" ]; then
    stop
else
    echo -e "usage:\t$(basename "$0")\tstart|stop"
    if [ -n "$1" ]; then
        exit 1
    fi
fi

exit 0
