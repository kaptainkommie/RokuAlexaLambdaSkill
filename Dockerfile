FROM resin/rpi-raspbian 
MAINTAINER jknoll 

ENV DEBIAN_FRONTEND noninteractive

# essential tools

RUN apt-get update && \ 
    apt-get install -y curl && \
    curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash - && \
    apt-get install -y nodejs build-essential

WORKDIR /tmp
COPY ./RokuControlServer/ .
RUN npm install

EXPOSE 1234 

ENTRYPOINT ["node","server.js"]]
