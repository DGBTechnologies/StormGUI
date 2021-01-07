#!/bin/bash

mkdir /home/archive
mkdir /home/temp

http-server /opt/web_app/front_end --port 8081 2>&1 &

/opt/web_app/back_end $LICENSE_KEY