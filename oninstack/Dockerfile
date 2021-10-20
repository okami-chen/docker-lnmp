FROM ubuntu:20.04
LABEL Author="Okami-Chen"
LABEL Version="fpm-7.2"
LABEL Description="PHP FPM 7.4"
WORKDIR /tmp
ADD http://mirrors.linuxeye.com/oneinstack-full.tar.gz /tmp/oneinstack-full.tar.gz
COPY ./options.conf /tmp/options.conf
COPY ./versions.txt /tmp/versions.txt
RUN tar xzf oneinstack-full.tar.gz && cat /tmp/options.conf > /tmp/oneinstack/options.conf \
    && cat /tmp/versions.txt > /tmp/oneinstack/versions.txt \
    && ./oneinstack/install.sh --nginx_option 2 --php_option 10 --phpcache_option 1 --php_extensions fileinfo,redis,swoole