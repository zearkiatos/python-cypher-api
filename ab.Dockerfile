FROM ubuntu:20.04

RUN apt-get update

RUN apt-get -qq -y install curl

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get install -y apache2-utils \
build-essential \
libreadline-dev

RUN apt-get install -y gnuplot && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /home

RUN mkdir data

RUN mkdir data/reports
RUN mkdir data/template
COPY ./docker/template /home/data/template

COPY ./data-cifrar.json /home/data/
COPY ./data-descifrar.json /home/data/