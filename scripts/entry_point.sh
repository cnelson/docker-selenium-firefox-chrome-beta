#!/bin/bash

# handle host file injection
if [ ! -z "$HOSTS" ]; then
   echo "$HOSTS" >> /etc/hosts
fi

export DISPLAY=:99

export PATH="/opt/firefox:$PATH"

Xvfb :99 -shmem -screen 0 1366x768x16 &

# wait for the X server to come up
sleep 5;

x11vnc -passwd secret -display :99 -N -forever &

java -jar /opt/selenium/selenium-server-standalone-2.44.0.jar "$@"

