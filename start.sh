#!/bin/bash

/opt/server_build/venv/bin/python /opt/server_build/run.py > /home/server.logs 2>&1 &

http-server /opt/gui_build > /home/gui.logs 2>&1 &

tail -f /home/server.logs -f /home/gui.logs

