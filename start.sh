#!/bin/bash

mkdir /home/models

mkdir /home/logs

/opt/storm_gui/back_end $LICENSE_KEY > /home/logs/back_end.logs 2>&1 &

http-server /opt/storm_gui/front_end > /home/logs/front_end.logs 2>&1 &

tail -f /home/logs/front_end.logs -f /home/logs/back_end.logs