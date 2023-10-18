FROM ubuntu:20.04

RUN apt-get update

RUN apt-get -qq -y install curl

RUN apt-get install -y apache2-utils

WORKDIR /home

RUN mkdir data

COPY ./data-cifrar.json /home/data/
COPY ./data-descifrar.json /home/data/