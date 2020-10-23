FROM movesrwth/storm:travis

WORKDIR /

COPY server_build /opt/server_build
COPY gui_build /opt/gui_build


RUN apt-get update && apt-get -y upgrade

# gui dependencies
RUN apt-get -y install nodejs npm
RUN npm install -g http-server

# server dependencies
RUN apt-get update && apt-get -y install python3.8 python3.8-venv
RUN python3.8 -m venv /opt/server_build/venv
RUN /opt/server_build/venv/bin/pip install -r /opt/server_build/requirements.txt


#create empty logs
RUN touch /home/server.logs && touch /home/gui.logs

COPY start.sh /usr/local/bin
RUN chmod +x /usr/local/bin/start.sh

CMD ["start.sh"]

WORKDIR /home

EXPOSE 8080
EXPOSE 5000