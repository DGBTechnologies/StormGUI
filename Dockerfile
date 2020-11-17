FROM movesrwth/storm:travis

USER root
WORKDIR /

# Set default env values
ENV LICENSE_KEY ""

COPY storm_gui /opt/storm_gui


RUN apt-get update && apt-get -y upgrade

# gui dependencies
RUN apt-get -y install nodejs npm
RUN npm install -g http-server

# server dependencies
# RUN apt-get update && apt-get -y install python3.8 python3.8-venv
# RUN python3.8 -m venv /opt/server_build/venv
# RUN /opt/server_build/venv/bin/pip install -r /opt/server_build/requirements.txt


#create empty log files
#RUN mkdir /home/logs && touch /home/logs/front_end.logs && touch /home/logs/back_end.logs

COPY start.sh /usr/local/bin
RUN chmod +x /usr/local/bin/start.sh

EXPOSE 8080
EXPOSE 5000

CMD ["start.sh"]
