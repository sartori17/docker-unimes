FROM tommylau/php-5.2
MAINTAINER sartori.felipe@gmail.com

ENV DOCUMENT_ROOT /var/www/html
ENV ENVIRONMENT dev

RUN \
  apt-get update && \
  apt-get install -y \
    curl \
    wget \
    vim \
    git \
    locales \
    apache2 \
    php5 \
    php5-mysql \
    php5-mcrypt \
    php5-gd \
    php5-curl \
    php-pear \
    php-apc \
    php5-cli \
    php5-curl \
    php5-mcrypt \
    php5-sqlite \
    php5-tidy \
    php5-imap \
    php5-json \
    php5-imagick \
    libapache2-mod-php5 && \
  a2enmod proxy && \
  a2enmod proxy_http && \
  a2enmod alias && \
  a2enmod dir && \
  a2enmod env && \
  a2enmod mime && \
  a2enmod rewrite && \
  a2enmod status && \
  a2enmod filter && \
  a2enmod deflate && \
  a2enmod setenvif && \
  a2enmod vhost_alias && \
  apt-get autoremove -y && \
  apt-get clean && \
rm -rf /var/lib/apt/lists

RUN apt-get install -y vim
RUN git config --global user.name "Felipe Sartori"
RUN git config --global user.email "sartori.felipe@gmail.com"

RUN ln -sf /dev/stderr /var/log/apache2/error.log

WORKDIR /root

COPY default.conf /etc/apache2/sites-available/default.conf
COPY php.ini    /etc/php5/apache2/conf.d/
COPY php.ini    /etc/php5/cli/conf.d/
#COPY run.sh /root/run.sh
#COPY dummy.crt  /etc/ssl/crt/dummy.crt
#COPY dummy.key /etc/ssl/crt/dummy.key

#RUN chmod +x run.sh

EXPOSE 80 8082 433

RUN /etc/init.d/apache2 start

#RUN cat /etc/apache2/sites-available/default

#ENTRYPOINT ["/bin/bash", "/run.sh"]