FROM php:7.1.9-apache
MAINTAINER sartori.felipe@gmail.com

RUN a2enmod rewrite
RUN apt-get update && apt-get install -y vim
RUN docker-php-ext-install pdo pdo_mysql
RUN docker-php-ext-install mysqli 
RUN apt-get install -y zlib1g-dev
RUN docker-php-ext-install zip
RUN apt-get install -y xclip
RUN apt-get install -y git
RUN git config --global user.name "Felipe Sartori"
RUN git config --global user.email "sartori.felipe@gmail.com"

WORKDIR /root