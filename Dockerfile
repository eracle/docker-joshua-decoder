FROM openjdk:8
MAINTAINER Antonio Ercole De Luca <eracle@posteo.eu>

# Setup env
USER root

# Install other build dependencies:
RUN \
  apt-get update && \
  apt-get install -y \
    cmake \
    gcc \
    g++ \
    libboost-all-dev \
    make \
    zlib1g-dev

WORKDIR /usr/local/joshua

#Ports:
EXPOSE 5674

RUN wget -q -O - "https://ucbc039f0dd6bf798014dfcc7b71.dl.dropboxusercontent.com/cd/0/get/A4-dzL_s1BU3q-vId5AOYXEKQ-lv0FgVrObrjYfzp0i-F_RgCy2Eqr1lEs-WlI810pNcJ9giWvAhNptWCmNTqUB3rUztXokXxedTpCDvGN4UuA/file?_download_id=90100557251024334217239657756984195127217415196343431756561034296&_notify_domain=www.dropbox.com&dl=1" | tar -xzf - -C /usr/local
WORKDIR /usr/local/apache-joshua-it-en-2016-11-18
CMD ["./joshua", "-server-port", "5674", "-server-type", "http"]
