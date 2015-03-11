#!/bin/bash

export DISPLAY=:99

export PATH="/opt/firefox:$PATH"

Xvfb :99 -shmem -screen 0 1366x768x16 &
x11vnc -passwd secret -display :99 -N -forever &

java -jar /opt/selenium/selenium-server-standalone-2.44.0.jar "$@"

