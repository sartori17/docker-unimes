FROM php:7.1.4-apache
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

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN curl -o /tmp/composer-setup.php https://getcomposer.org/installer \
&& curl -o /tmp/composer-setup.sig https://composer.github.io/installer.sig \
# Make sure we're installing what we think we're installing!
&& php -r "if (hash('SHA384', file_get_contents('/tmp/composer-setup.php')) !== trim(file_get_contents('/tmp/composer-setup.sig'))) { unlink('/tmp/composer-setup.php'); echo 'Invalid installer' . PHP_EOL; exit(1); }" \
&& php /tmp/composer-setup.php --no-ansi --install-dir=/usr/local/bin --filename=composer --snapshot \
&& rm -f /tmp/composer-setup.*

COPY addvhost_docker.sh /root/addvhost_docker.sh
COPY vhosts.sh /root/vhosts.sh
COPY vhost.skeleton.docker.conf /root/vhost.skeleton.docker.conf

RUN /bin/bash -c "./vhosts.sh"

