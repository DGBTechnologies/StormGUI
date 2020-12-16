#!/bin/bash

mkdir /home/models

http-server /opt/storm_gui/front_end 2>&1 &

tail -f /opt/storm_gui/back_end $LICENSE_KEY