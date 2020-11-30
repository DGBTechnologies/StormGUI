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


COPY start.sh /usr/local/bin
RUN chmod +x /usr/local/bin/start.sh

EXPOSE 8080
EXPOSE 5000

CMD ["start.sh"]
